---Create THE DATABASE
CREATE DATABASE HR;

USE HR;

--Table for departments
CREATE TABLE departments (
    id INT PRIMARY KEY IDENTITY(1,1),  --Auto-incrementing ID
    department_name NVARCHAR(100) NOT NULL,  -- Department name
    location_name NVARCHAR(100),  
    Email NVARCHAR(50),
    phone_number NVARCHAR(15) NOT NULL
);

-- Table for job Positions
CREATE TABLE positions (
    id INT PRIMARY KEY IDENTITY(1,1),  
    position_name NVARCHAR(100) NOT NULL,  
    position_description NVARCHAR(255)  
);

-- Employee details
CREATE TABLE employees (
    id INT PRIMARY KEY IDENTITY(1,1),  
    first_name NVARCHAR(100) NOT NULL,  
    last_name NVARCHAR(100) NOT NULL,  
    date_of_birth DATE NOT NULL,  
    Email NVARCHAR(50),
    phone_number NVARCHAR(15) NOT NULL,
    position_id INT NOT NULL,  -- Foreign key 
    hire_date DATE NOT NULL,  
    department_id INT NOT NULL,  -- Foreign key to departments table
    employee_status NVARCHAR(50) NOT NULL,  
    FOREIGN KEY (position_id) REFERENCES positions(id),  -- Links to positions.id
    FOREIGN KEY (department_id) REFERENCES departments(id)  -- Links to departments.id
);

--Tracks Attendance
CREATE TABLE attendance (
    id INT PRIMARY KEY IDENTITY(1,1),  
    date_attendance DATE NOT NULL,  
    time_in TIME,  
    time_out TIME,  
    employee_id INT NOT NULL,  -- Foreign key to employees table
    attendance_status NVARCHAR(50),  
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Links  employees.id
);

-- Info on employee vacations
CREATE TABLE vacations (
    id INT PRIMARY KEY IDENTITY(1,1),  
    vacation_type NVARCHAR(100),  
    start_date DATE,  
    end_date DATE,  
    employee_id INT NOT NULL,--Foreign key to employees table
    vacation_status NVARCHAR(50),  
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Links to employees.id
);

-- Loans given to employees
CREATE TABLE loans (
    id INT PRIMARY KEY IDENTITY(1,1), 
    loan_amount DECIMAL(18, 2),  
    loan_date DATE,  
    loan_start DATE,  
    loan_end DATE,  
    employee_id INT NOT NULL,--- Foreign key to employees table
    loan_status NVARCHAR(50) DEFAULT 'Pending',  
    FOREIGN KEY (employee_id) REFERENCES employees(id),  -- Links to employees.id

    CHECK (loan_start <= loan_end)  ---ensure start date is before end date--
);

-- Overtime Records
CREATE TABLE overtime (
    id INT PRIMARY KEY IDENTITY(1,1),  --Auto-incrementing ID
    date_overtime DATE NOT NULL,  
    hours_overtime DECIMAL(5, 2),  
    employee_id INT NOT NULL,  -- Foreign key to employees table
    overtime_status NVARCHAR(50),  
    FOREIGN KEY (employee_id) REFERENCES employees(id)  --Links to Employees.id
);

-- Bonuses awarded to employees
CREATE TABLE bonus (
    id INT PRIMARY KEY IDENTITY(1,1),-- Auto-incrementing ID
    bonus_amount DECIMAL(18, 2),  
    bonus_date DATE,  
    employee_id INT NOT NULL,  --Foreign key  employees table
    bonus_status NVARCHAR(50),  
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Links Employees.id

);

-- Payroll info
CREATE TABLE payroll (
    id INT PRIMARY KEY IDENTITY(1,1), 
    gross_salary DECIMAL(18, 2),  
    income_tax DECIMAL(18, 2),  
    net_salary DECIMAL(18, 2),  
    payment_date DATE,  
    employee_id INT NOT NULL,  -- Foreign key to employees table
    payroll_status NVARCHAR(50),  
    FOREIGN KEY (employee_id) REFERENCES employees(id) 	); -- Links TO EMployees.id

