/*
   11 December 202008:07:16
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
CREATE TABLE dbo.DepartmentName
	(
	ID int NOT NULL IDENTITY (1, 1),
	DepartmentName nvarchar(256) NOT NULL,
	CreatedBy nvarchar(128) NOT NULL,
	CreatedOn datetime NOT NULL,
	UpdatedBy nvarchar(128) NULL,
	UpdatedOn datetime NULL,
	RowVersion timestamp NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.DepartmentName ADD CONSTRAINT
	PK_DepartmentName PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.DepartmentName SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.DepartmentName', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.DepartmentName', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.DepartmentName', 'Object', 'CONTROL') as Contr_Per 