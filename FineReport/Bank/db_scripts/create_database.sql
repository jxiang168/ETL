-- drop database bank;

create database bank collate Chinese_PRC_CI_AS;

-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- bank.dbo.T_Bank definition

-- Drop table

-- DROP TABLE bank.dbo.T_Bank;

CREATE TABLE bank.dbo.T_Bank (
	ID_No int IDENTITY(1,1) NOT NULL,
	Company varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	User_Name varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Bank_Name varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Account_Number varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Currency varchar(4) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Account_Type varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Bank_Authority varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Bank_Location varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Remark1 varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Remark2 varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Remark3 varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Entered_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Entered_Date datetime NULL,
	Updated_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Updated_Date datetime NULL,
	CONSTRAINT PK_T_Bank PRIMARY KEY (Account_Number,Currency,Account_Type)
);


-- bank.dbo.T_Bank_Balance definition

-- Drop table

-- DROP TABLE bank.dbo.T_Bank_Balance;

CREATE TABLE bank.dbo.T_Bank_Balance (
	ID_No int IDENTITY(1,1) NOT NULL,
	Bank_ID_No int NOT NULL,
	Balance_Date datetime NOT NULL,
	Balance_Amount float DEFAULT 0 NOT NULL,
	Entered_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Entered_Date datetime NULL,
	Updated_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Updated_Date datetime NULL
);


-- bank.dbo.T_Currency_Exchange definition

-- Drop table

-- DROP TABLE bank.dbo.T_Currency_Exchange;

CREATE TABLE bank.dbo.T_Currency_Exchange (
	ID_No int IDENTITY(1,1) NOT NULL,
	Exchange_Date datetime NOT NULL,
	Currency varchar(4) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Exchange float DEFAULT 1 NOT NULL,
	Entered_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Entered_Date datetime NULL,
	Updated_By varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Updated_Date datetime NULL
);


-- bank.dbo.T_Login_Info definition

-- Drop table

-- DROP TABLE bank.dbo.T_Login_Info;

CREATE TABLE bank.dbo.T_Login_Info (
	ID_No int IDENTITY(1,1) NOT NULL,
	Computer_Name nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Login_User_Name nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	IP_Address nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	MAC_Address nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Application_User_Name nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Login_Time nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Logout_Time nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL
);


-- bank.dbo.T_User definition

-- Drop table

-- DROP TABLE bank.dbo.T_User;

CREATE TABLE bank.dbo.T_User (
	User_No nvarchar(1) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	User_Name nvarchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Cryptogram nvarchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	Build_Date datetime NOT NULL,
	Remark nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK_T_User PRIMARY KEY (User_No)
);


-- bank.dbo.T_User_Menu definition

-- Drop table

-- DROP TABLE bank.dbo.T_User_Menu;

CREATE TABLE bank.dbo.T_User_Menu (
	ID_No int IDENTITY(1,1) NOT NULL,
	User_No nvarchar(1) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Menu_Name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	Permit nvarchar(127) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK_T_User_Menu PRIMARY KEY (User_No,Menu_Name)
);


-- bank.dbo.T_Version definition

-- Drop table

-- DROP TABLE bank.dbo.T_Version;

CREATE TABLE bank.dbo.T_Version (
	Version nvarchar(25) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL
);


-- bank.dbo.dtproperties definition

-- Drop table

-- DROP TABLE bank.dbo.dtproperties;

CREATE TABLE bank.dbo.dtproperties (
	id int IDENTITY(1,1) NOT NULL,
	objectid int NULL,
	property varchar(64) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	value varchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	uvalue nvarchar(127) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	lvalue image NULL,
	version int DEFAULT 0 NOT NULL,
	CONSTRAINT pk_dtproperties PRIMARY KEY (id,property)
);
