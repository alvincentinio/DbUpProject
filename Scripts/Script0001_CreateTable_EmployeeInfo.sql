/*
   11 December 202007:41:49
   User: 
   Server: .
   Database: DbUbDemoDb
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
CREATE TABLE dbo.EmployeeName
	(
	ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL,
	StaffNo int NOT NULL,
	CreatedBy nvarchar(128) NOT NULL,
	CreatedOn datetime NOT NULL,
	UpdatedBy nvarchar(128) NULL,
	UpdatedOn datetime NULL,
	RowVersion timestamp NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.EmployeeName ADD CONSTRAINT
	PK_EmployeeName PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EmployeeName SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EmployeeName', 'Object', 'CONTROL') as Contr_Per 