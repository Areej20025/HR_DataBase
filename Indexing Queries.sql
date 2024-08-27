

--Create index on hire_date to improve queries filtering by hire date
CREATE INDEX idx_HireDate
ON employees (hire_date);

SELECT hire_date --Test the index
FROM employees;

--Index department_id and employee_status to speed up department/status queries
CREATE INDEX idx_DepartmentAndStatus
ON employees (department_id, employee_status);

-- Check index effectiveness
SELECT department_id, employee_status FROM employees;

-- Index on last_name for faster searches by last name
CREATE INDEX idx_LastName 
ON employees (last_name);

-- Verify THE INdex
SELECT last_name 
FROM employees;

-- Index on date_attendance and employee_id to optimize attendance queries
CREATE INDEX idx_AttendanceDateAndEmployee
ON attendance (date_attendance, employee_id);

-- Test the index
SELECT date_attendance, employee_id 
FROM attendance;

--index on vacation_type for better vacation type queries
CREATE  INDEX idx_VacationType
 ON vacations (vacation_type);

-- Verify the index
SELECT vacation_type
  FROM vacations;

-- Index on loan_status and loan_date to speed up loan-related queries
CREATE INDEX idx_LoanStatusAndDate
   ON loans (loan_status, loan_date);


SELECT loan_status, loan_date -- Test the index
FROM loans;



-- Index on payment_date to improve payroll queries by payment date
CREATE INDEX idx_PaymentDate
ON payroll (payment_date);


SELECT payment_date -- Verify the index
FROM payroll;




