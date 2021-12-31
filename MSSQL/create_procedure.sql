CREATE     procedure dbo.p_rfs_execute
	@execType nvarchar(300), @execName nvarchar(300), @enableLogging bit = 0 as
--declare @execType nvarchar(300) = 'TASK', @execName nvarchar(300) = 'DIM_EBS_CST_RESOURCE_OVERHEADS';
--declare @execType nvarchar(300) = 'STEP', @execName nvarchar(300) = 'DM_TRIAL';
declare @DATABASE_NAME nvarchar(300), @SCHEMA_NAME nvarchar(300), @TABLE_NAME nvarchar(300), @SQL_TEXT nvarchar(max) ,@ERROR_FLAG BIT, @ERROR_MSG NVARCHAR(MAX);

if @execType not in ('JOB','STEP','TASK')
begin
	print 'Error: execType must be JOB, STEP or TASK';
	return;
end

if @execType = 'JOB'
	begin
		print concat(getdate(),' Begin job ',@execName) ;
		declare c_tasks cursor local for
			SELECT tsk.DATABASE_NAME , tsk.SCHEMA_NAME , tsk.TABLE_NAME , tsk.SQL_TEXT
			from hcpdw.dbo.RFS_DIM_JOBS jbs
			inner join hcpdw.dbo.RFS_DIM_JOB_SEQ_STEP jsq on jsq.JOB_ID  = jbs.JOB_ID
			inner join hcpdw.dbo.RFS_DIM_STEPS stp on stp.STEP_ID  = jsq.STEP_ID
			inner join hcpdw.dbo.RFS_DIM_STEP_SEQ_TASK stq on stq.STEP_ID = stp.STEP_ID
			inner join hcpdw.dbo.RFS_DIM_TASKS tsk on tsk.TASK_ID  = stq.TASK_ID
			where jbs.JOB_NAME  = @execName
			and jsq.ENABLE_FLAG  = 1 and stq.ENABLE_FLAG = 1
			order by jsq.SEQ_NO , stq.SEQ_NO ;
	end
if @execType = 'STEP'
	begin
		print concat(getdate(),' Begin step ',@execName) ;
		declare c_tasks cursor local for
			SELECT tsk.DATABASE_NAME , tsk.SCHEMA_NAME , tsk.TABLE_NAME , tsk.SQL_TEXT
			from hcpdw.dbo.RFS_DIM_STEPS stp
			inner join hcpdw.dbo.RFS_DIM_STEP_SEQ_TASK stq on stq.STEP_ID = stp.STEP_ID
			inner join hcpdw.dbo.RFS_DIM_TASKS tsk on tsk.TASK_ID  = stq.TASK_ID
			where stp.STEP_NAME  = @execName
			and stq.ENABLE_FLAG = 1
			order by stq.SEQ_NO ;
	end
if @execType = 'TASK'
	begin
		print concat(getdate(),' Begin task ',@execName) ;
		declare c_tasks cursor local for
			SELECT tsk.DATABASE_NAME , tsk.SCHEMA_NAME , tsk.TABLE_NAME , tsk.SQL_TEXT
			from hcpdw.dbo.RFS_DIM_TASKS tsk
			where tsk.TASK_NAME  = @execName;
	end


open c_tasks;
SET @ERROR_FLAG = 0;
SET @ERROR_MSG = NULL;
fetch c_tasks into @DATABASE_NAME, @SCHEMA_NAME, @TABLE_NAME, @SQL_TEXT;

WHILE @@FETCH_STATUS = 0
begin
	BEGIN TRY
		begin transaction;
		print concat(getdate(),' Begin refreshing ',@DATABASE_NAME,'.',@SCHEMA_NAME,'.',@TABLE_NAME) ;
		--exec sp_executesql @SQL_TEXT;
		SET @SQL_TEXT = CONCAT('USE ',@DATABASE_NAME,CHAR(10),@SQL_TEXT);
		exec(@SQL_TEXT);
		print concat(getdate(),' End refreshing ',@DATABASE_NAME,'.',@SCHEMA_NAME,'.',@TABLE_NAME) ;
		commit;
	END TRY
	BEGIN CATCH
		rollback;
		SET @ERROR_FLAG = 1;
		SET @ERROR_MSG = ERROR_MESSAGE() ;
	END CATCH;
	PRINT @ERROR_FLAG;
	if @enableLogging=1
	begin
		begin transaction;
	  WITH S AS (SELECT @DATABASE_NAME AS DATABASE_NAME, @SCHEMA_NAME AS SCHEMA_NAME, @TABLE_NAME AS TABLE_NAME, GETDATE() AS [DW_UPDATETIME], @ERROR_FLAG as ERROR_FLAG, @ERROR_MSG as ERROR_MSG)
		MERGE hcpdw.dbo.RFS_DIM_TABLE_CONTROL AS T USING S ON (T.DATABASE_NAME = S.DATABASE_NAME AND T.[SCHEMA_NAME]=S.[SCHEMA_NAME] AND T.[TABLE_NAME] = S.[TABLE_NAME])
			WHEN MATCHED THEN UPDATE SET [ERROR_FLAG] = S.ERROR_FLAG,[ERROR_MSG] = S.ERROR_MSG, [DW_UPDATETIME] = (CASE WHEN @ERROR_FLAG = 0 THEN S.[DW_UPDATETIME] ELSE T.[DW_UPDATETIME] END), [REFRESH_BY_JOB] = @execName
			WHEN NOT MATCHED THEN INSERT([DATABASE_NAME],[SCHEMA_NAME],[TABLE_NAME], [ERROR_FLAG],[ERROR_MSG],[DW_UPDATETIME],[REFRESH_BY_JOB]) VALUES (S.[DATABASE_NAME],S.[SCHEMA_NAME], S.[TABLE_NAME],S.ERROR_FLAG,S.ERROR_MSG,S.[DW_UPDATETIME],@execName);
		commit;
	end

	SET @ERROR_FLAG = 0;
	SET @ERROR_MSG = NULL;
	fetch c_tasks into @DATABASE_NAME, @SCHEMA_NAME, @TABLE_NAME, @SQL_TEXT;

end

close c_tasks;

print concat(getdate(),' End execute ',@execName) ;
