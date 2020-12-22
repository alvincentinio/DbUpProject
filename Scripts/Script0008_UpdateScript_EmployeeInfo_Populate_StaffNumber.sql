UPDATE dbo.EmployeeName
SET StaffNumber = StaffNo_dup
WHERE StaffNumber IS NULL;