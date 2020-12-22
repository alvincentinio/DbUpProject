UPDATE dbo.EmployeeName
SET StaffNo_dup = StaffNo
WHERE StaffNo_dup IS NULL;

UPDATE dbo.EmployeeName
SET StaffNo = NULL
WHERE StaffNo IS NOT NULL;
