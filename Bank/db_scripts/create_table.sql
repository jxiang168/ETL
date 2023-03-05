
CREATE SCHEMA bank;


-- DROP TABLE hcpods.bank.T_Bank;

CREATE TABLE hcpods.bank.T_Bank (
	ID_No int NOT NULL,
	Company nvarchar(50) NOT NULL,
	User_Name nvarchar(20) NOT NULL,
	Bank_Name nvarchar(100) NOT NULL,
	Account_Number nvarchar(30) NOT NULL,
	Currency nvarchar(4) NOT NULL,
	Account_Type nvarchar(20) NOT NULL,
	Bank_Authority nvarchar(50) NULL,
	Bank_Location nvarchar(20) NULL,
	Remark1 nvarchar(100) NULL,
	Remark2 nvarchar(100) NULL,
	Remark3 nvarchar(100) NULL,
	Entered_By nvarchar(20) NULL,
	Entered_Date datetime NULL,
	Updated_By nvarchar(20) NULL,
	Updated_Date datetime NULL,
	DW_UPDATETIME DATETIME
);


-- DROP TABLE hcpods.bank.T_Bank_Balance;

CREATE TABLE hcpods.bank.T_Bank_Balance (
	ID_No int NOT NULL,
	Bank_ID_No int NOT NULL,
	Balance_Date datetime NOT NULL,
	Balance_Amount float DEFAULT 0 NOT NULL,
	Entered_By nvarchar(20)  NULL,
	Entered_Date datetime NULL,
	Updated_By nvarchar(20)  NULL,
	Updated_Date datetime NULL,
	DW_UPDATETIME DATETIME
);


-- DROP TABLE hcpods.bank.T_Currency_Exchange;

CREATE TABLE hcpods.bank.T_Currency_Exchange (
	ID_No int NOT NULL,
	Exchange_Date datetime NOT NULL,
	Currency nvarchar(4) NOT NULL,
	Exchange float NOT NULL,
	Entered_By nvarchar(20) NULL,
	Entered_Date datetime NULL,
	Updated_By nvarchar(20)  NULL,
	Updated_Date datetime NULL,
	DW_UPDATETIME DATETIME
);



-- DROP TABLE HCPDW.DBO.BANK_DIM_BANK_ACCOUNTS;

--CREATE TABLE HCPDW.DBO.BANK_DIM_BANK_ACCOUNTS (
--	SOURCE_TYPE NVARCHAR(30),
--	SOURCE_ID INT,
--	ACCOUNT_ID INT IDENTITY(100001,1) NOT NULL,
--	COMPANY NVARCHAR(50) NOT NULL,
--	USER_NAME NVARCHAR(20) NOT NULL,
--	BANK_NAME NVARCHAR(100) NOT NULL,
--	ACCOUNT_NUMBER NVARCHAR(30) NOT NULL,
--	CURRENCY NVARCHAR(4) NOT NULL,
--	ACCOUNT_TYPE NVARCHAR(20) NOT NULL,
--	BANK_AUTHORITY NVARCHAR(50) ,
--	BANK_LOCATION NVARCHAR(20) ,
--	REMARK1 NVARCHAR(100) ,
--	REMARK2 NVARCHAR(100) ,
--	REMARK3 NVARCHAR(100) ,
--	UPDATED_BY NVARCHAR(20) ,
--	UPDATED_DATE DATETIME ,
--	DW_UPDATETIME DATETIME
--);

--drop table hcpods.bank.T_User
CREATE TABLE hcpods.bank.T_User (
	User_No nvarchar(3)   NOT NULL,
	User_Name nvarchar(20)   NOT NULL,
	Cryptogram nvarchar(20)  NULL,
	Build_Date datetime NOT NULL,
	Remark nvarchar(200)  NULL,
	DW_UPDATETIME DATETIME
);


--create table HCPDW.DBO.BANK_DIM_USERS (
--ID smallint identity(1001,1) primary key,
--USER_NAME NVARCHAR(300),
--REMARK NVARCHAR(3000),
--ORIG_USER_NAME NVARCHAR(300),
--CRATED_BY NVARCHAR(300),
--CREATION_DATE DATETIME,
--LAST_UPDATED_BY  NVARCHAR(300),
--LAST_UPDATE_DATE DATETIME
--);



CREATE TABLE HCPDW.DBO.BANK_DIM_BANK (
	BANK_UID UNIQUEIDENTIFIER NOT NULL,
	BANK_NAME NVARCHAR(300) NOT NULL unique,
	ORIG_BANK_NAME NVARCHAR(300),
	BANK_LOCATION NVARCHAR(300) NOT NULL,
	REMARK NVARCHAR(3000),
	SOURCE_CODE NVARCHAR(30),
	SOURCE_ID INT,
	UPDATE_DATE DATETIME,
	UPDATE_BY NVARCHAR(300),
	ENABLED BIT,
	PRIMARY KEY (BANK_UID)
	);


CREATE TABLE HCPDW.dbo.BANK_DIM_BANK_ACCOUNT (
	ACCOUNT_UID uniqueidentifier NOT NULL,
	ACCOUNT_NUMBER nvarchar(300) COLLATE Chinese_PRC_CI_AS NOT NULL,
	LEDGER_NAME nvarchar(300) COLLATE Chinese_PRC_CI_AS NOT NULL,
	REMARK nvarchar(3000) COLLATE Chinese_PRC_CI_AS NULL,
	BANK_UID uniqueidentifier NOT NULL,
	ORIG_COMPANY nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
	ORIG_BANK_NAME nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
	SOURCE_CODE nvarchar(30) COLLATE Chinese_PRC_CI_AS NULL,
	SOURCE_ID int NULL,
	UPDATE_DATE datetime NULL,
	UPDATE_BY nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
	ENABLED bit NULL,
	PERMIT_ROLES NVARCHAR(3000),
	PRIMARY KEY (ACCOUNT_UID),
	UNIQUE (ACCOUNT_NUMBER)
);

create table HCPDW.DBO.BANK_DIM_ACCOUNT_USE (
	USE_UID uniqueidentifier NOT NULL,
	ACCOUNT_TYPE nvarchar(300) NOT NULL,
	CURRENCY nvarchar(300) NOT NULL,
	ACCOUNT_UID uniqueidentifier NOT NULL,
	REMARK nvarchar(3000),
	ORIG_ACCOUNT_TYPE nvarchar(300),
	ORIG_REMARK nvarchar(3000),
	SOURCE_CODE nvarchar(30) COLLATE Chinese_PRC_CI_AS NULL,
	SOURCE_ID int NULL,
	UPDATE_DATE datetime NULL,
	UPDATE_BY nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
	ENABLED bit NULL,
	PRIMARY KEY (USE_UID),
	UNIQUE (ACCOUNT_UID,ACCOUNT_TYPE,CURRENCY)
)
;

create table hcpdw.dbo.BANK_FACT_ACCOUNT_BALANCE(
	BALANCE_ID INT IDENTITY(1,1) NOT NULL,
	BALANCE_DATE date NOT NULL,
	BALANCE_AMOUNT NUMERIC(38,10),
	USE_UID uniqueidentifier NOT NULL,
	REMARK nvarchar(3000),
	SOURCE_CODE nvarchar(30),
	SOURCE_ID int NULL,
	UPDATE_DATE datetime NULL,
	UPDATE_BY nvarchar(300),
	PRIMARY KEY(BALANCE_ID),
	UNIQUE(USE_UID,BALANCE_DATE)
);

