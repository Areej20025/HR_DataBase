# HR System Database

This repository contains the SQL script for creating a Human Resources (HR) system database. The database includes tables for employees, departments, attendance, vacations, loans, overtime, bonuses, and payroll with income tax.

## Tables

- *departments*: Contains department information.
- *positions*: Contains position information.
- *employee*: Contains employee information and links to departments and positions.
- *attendance*: Contains attendance records.
- *vacations*: Contains vacation records.
- *loans*: Contains loan records.
- *overtime*: Contains overtime records.
- *bonus*: Contains bonus records.
- *payroll_with_income_tax*: Contains payroll records with income tax details.

## Usage

Run the HR_System.sql script on your SQL Server to create the database and all tables.

## ER Diagram

The Entity-Relationship (ER) diagram below illustrates the structure of the HR System database. It shows the tables, their columns, and the relationships between them:

![ER Diagram](https://github.com/Areej20025/HR_DataBase/blob/main/HR%20Entity%20Relationship%20Diagram.png)

## Advanced SQL Queries

Here are some advanced SQL queries used in this project:

```sql
-- Example of a join query to get employee details with their department
SELECT e.first_name, e.last_name, d.name as department
FROM employee e
JOIN departments d ON e.department_id = d.id;

-- Example of a stored procedure to get employee attendance
CREATE PROCEDURE GetEmployeeAttendance @EmployeeID INT
AS
BEGIN
    SELECT * FROM attendance WHERE employee_id = @EmployeeID;
END;

-- Example of a trigger to update employee status
CREATE TRIGGER trg_UpdateEmployeeStatus
ON employee
AFTER UPDATE
AS
BEGIN
    UPDATE employee
    SET employee_status = 'Updated'
    WHERE id IN (SELECT id FROM inserted);
END;
