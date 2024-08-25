-- Create the database
CREATE DATABASE HR_DataBase;

-- Create the departments table
CREATE TABLE departments (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    location NVARCHAR(100)
);

-- Create the positions table
CREATE TABLE positions (
    id INT PRIMARY KEY IDENTITY(1,1),
    position_name NVARCHAR(100) NOT NULL,
    position_description NVARCHAR(255)
);

-- Create the employee table
CREATE TABLE employee (
    id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    position_id INT,
    hire_date DATE,
    department_id INT,
    employee_status NVARCHAR(50),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Create the attendance table
CREATE TABLE attendance (
    id INT PRIMARY KEY IDENTITY(1,1),
    date_attendance DATE NOT NULL,
    time_in TIME,
    time_out TIME,
    employee_id INT,
    attendance_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create the vacations table
CREATE TABLE vacations (
    id INT PRIMARY KEY IDENTITY(1,1),
    vacation_type NVARCHAR(100),
    start_date DATE,
    end_date DATE,
    employee_id INT,
    vacation_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create the loans table
CREATE TABLE loans (
    id INT PRIMARY KEY IDENTITY(1,1),
    loan_amount DECIMAL(18, 2),
    loan_date DATE,
    loan_start DATE,
    loan_end DATE,
    employee_id INT,
    loan_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create the overtime table
CREATE TABLE overtime (
    id INT PRIMARY KEY IDENTITY(1,1),
    date_overtime DATE NOT NULL,
    hours_overtime DECIMAL(5, 2),
    employee_id INT,
    overtime_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create the bonus table
CREATE TABLE bonus (
    id INT PRIMARY KEY IDENTITY(1,1),
    bonus_amount DECIMAL(18, 2),
    bonus_date DATE,
    employee_id INT,
    bonus_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create the payroll_with_income_tax table
CREATE TABLE payroll_with_income_tax (
    id INT PRIMARY KEY IDENTITY(1,1),
    gross_salary DECIMAL(18, 2),
    income_tax DECIMAL(18, 2),
    net_salary DECIMAL(18, 2),
    payment_date DATE,
    employee_id INT,
    payroll_status NVARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);
