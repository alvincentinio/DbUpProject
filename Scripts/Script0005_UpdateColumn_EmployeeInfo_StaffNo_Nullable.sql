/*
   22 December 202014:57:01
   User: 
   Server: .
   Database: DbUpDemoDb
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_EmployeeName
	(
	ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL,
	StaffNo int NULL,
	CreatedBy nvarchar(128) NOT NULL,
	CreatedOn datetime NOT NULL,
	UpdatedBy nvarchar(128) NULL,
	UpdatedOn datetime NULL,
	RowVersion timestamp NOT NULL,
	StaffNo_dup int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_EmployeeName SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_EmployeeName ON
GO
IF EXISTS(SELECT * FROM dbo.EmployeeName)
	 EXEC('INSERT INTO dbo.Tmp_EmployeeName (ID, Name, StaffNo, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, StaffNo_dup)
		SELECT ID, Name, StaffNo, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, StaffNo_dup FROM dbo.EmployeeName WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_EmployeeName OFF
GO
DROP TABLE dbo.EmployeeName
GO
EXECUTE sp_rename N'dbo.Tmp_EmployeeName', N'EmployeeName', 'OBJECT' 
GO
ALTER TABLE dbo.EmployeeName ADD CONSTRAINT
	PK_EmployeeName PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'CONTROL') as Contr_Per 