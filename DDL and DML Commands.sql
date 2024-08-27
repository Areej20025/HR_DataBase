
--Adding a Column to employees for middle name
ALTER TABLE employees
ADD middle_name NVARCHAR(100);


--Change EMAIL Size in departments table
ALTER TABLE departments
ALTER COLUMN Email NVARCHAR(100);


DROP TABLE bonus; --Remove bonus table


TRUNCATE TABLE payroll; --Clear payroll Table data but keep Structure

--
--Rename phone_number to contact_number in employees table
EXEC sp_rename 'employees.phone_number', 'contact_number', 'COLUMN';

-- SELECT first name, last name, and department
SELECT e.first_name, e.last_name, 
    d.department_name 
FROM employees AS e
INNER JOIN 
    departments AS d ON e.department_id = d.id;

-- Insert a new department, adding marketing
INSERT INTO departments (department_name, location_name, Email, phone_number)
VALUES ('Marketing', 'New York', 'marketing@company.com', '123-456-7890');

-- Set employee status to Inactive
UPDATE employees
SET employee_status = 'Inactive'
WHERE id = 5;

-- Delete employee with id 10
DELETE FROM employees
WHERE id = 10;
