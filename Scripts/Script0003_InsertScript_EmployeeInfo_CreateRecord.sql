USE [DbUpDemoDb]
GO
SET IDENTITY_INSERT [dbo].[EmployeeName] ON 
GO
INSERT [dbo].[EmployeeName] ([ID], [Name], [StaffNo], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'prasad', 323, N'prasad-a', CAST(N'2020-12-22T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[EmployeeName] ([ID], [Name], [StaffNo], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'admin', 123, N'prasad-a', CAST(N'2020-12-22T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EmployeeName] OFF
GO
