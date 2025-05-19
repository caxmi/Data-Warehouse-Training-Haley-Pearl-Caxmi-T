-- Create table EmpployeeAttendance
CREATE TABLE EmployeeAttendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(100),
    Date DATE,
    Status VARCHAR(50),
    HoursWorked INT
);

-- Sample Data Insertion
INSERT INTO EmployeeAttendance VALUES
(1, 'John Doe', 'IT', '2025-05-01', 'Present', 8),
(2, 'Priya Singh', 'HR', '2025-05-01', 'Absent', 0),
(3, 'Ali Khan', 'IT', '2025-05-01', 'Present', 7),
(4, 'Riya Patel', 'Sales', '2025-05-01', 'Late', 6),
(5, 'David Brown', 'Marketing', '2025-05-01', 'Present', 8);

-- view all data 
select * from EmployeeAttendance;

-- 1.Add new record
INSERT INTO EmployeeAttendance VALUES (6, 'Neha Sharma', 'Finance', '2025-05-01', 'Present', 8);

-- 2.Update attendance status for Riya Patel
UPDATE EmployeeAttendance SET Status = 'Present' WHERE EmployeeName = 'Riya Patel' AND Date = '2025-05-01';

-- 3.Delete Priya Singh's record
DELETE FROM EmployeeAttendance WHERE EmployeeName = 'Priya Singh' AND Date = '2025-05-01';

-- 4.Read all records sorted by name
SELECT * FROM EmployeeAttendance ORDER BY EmployeeName ASC;

-- 5.Sort by hours worked descending
SELECT * FROM EmployeeAttendance ORDER BY HoursWorked DESC;

-- 6.Filter by department = IT
SELECT * FROM EmployeeAttendance WHERE Department = 'IT';

-- 7.Filter by department=IT AND status=Present
SELECT * FROM EmployeeAttendance WHERE Department = 'IT' AND Status = 'Present';

-- 8.Filter where status is Absent OR Late
SELECT * FROM EmployeeAttendance WHERE Status IN ('Absent', 'Late');

-- 9.Total hours worked by department
SELECT Department, SUM(HoursWorked) AS TotalHours FROM EmployeeAttendance GROUP BY Department;

-- 10.Average hours worked overall
SELECT Date,AVG(HoursWorked) AS AvgHoursWorked FROM EmployeeAttendance GROUP BY Date ORDER BY Date;

-- 11.Attendance count by status
SELECT Status, COUNT(*) AS Count FROM EmployeeAttendance GROUP BY Status;

-- 12.Employee names starting with R
SELECT * FROM EmployeeAttendance WHERE EmployeeName LIKE 'R%';

-- 13.Present employees with >6 hours
SELECT * FROM EmployeeAttendance WHERE Status = 'Present' AND HoursWorked > 6;

-- 14.Hours between 6 and 8
SELECT * FROM EmployeeAttendance WHERE HoursWorked BETWEEN 6 AND 8;

-- 15.Top 2 employees with most hours
SELECT TOP 2 * FROM EmployeeAttendance ORDER BY HoursWorked DESC;

-- 16.Employees below average hours
SELECT * FROM EmployeeAttendance WHERE HoursWorked < (
    SELECT AVG(HoursWorked) FROM EmployeeAttendance
);

-- 17.Average hours by status
SELECT Status, AVG(HoursWorked) AS AvgHours FROM EmployeeAttendance GROUP BY Status;

-- 18.Find duplicate entries (same employee and date)
SELECT EmployeeName, Date, COUNT(*) AS EntryCount FROM EmployeeAttendance GROUP BY EmployeeName, Date HAVING COUNT(*) > 1;

-- 19.Department with most Present employees
SELECT TOP 1 Department, COUNT(*) AS PresentCount FROM EmployeeAttendance WHERE Status = 'Present' GROUP BY Department ORDER BY PresentCount DESC;

-- 20.Employee with max hours per department
SELECT * FROM EmployeeAttendance E WHERE HoursWorked = (
    SELECT MAX(HoursWorked)
    FROM EmployeeAttendance
    WHERE Department = E.Department
);
