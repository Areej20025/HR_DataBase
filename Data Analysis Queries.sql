-- Number of employees in each department
SELECT d.department_name, COUNT(e.id) AS number_of_employees
FROM  departments d
LEFT JOIN employees e 
ON d.id = e.department_id
GROUP BY 
d.department_name;



-- Total net salary paid per department
SELECT d.department_name, SUM(p.net_salary) AS total_net_salary
FROM departments d
JOIN employees e
ON d.id = e.department_id
JOIN payroll p 
ON e.id = p.employee_id
GROUP BY 
    d.department_name;



-- Employee attendance percentage
SELECT e.first_name, e.last_name, COUNT(a.id) * 100.0 / (SELECT COUNT(*) FROM attendance) AS attendance_percentage
FROM employees e
LEFT JOIN 
    attendance a
ON e.id = a.employee_id AND a.attendance_status = 'Present'
GROUP BY 
    e.first_name, e.last_name;



-- Total bonuses by approval status
SELECT bonus_status, 
    SUM(bonus_amount) AS total_bonuses
FROM bonus
GROUP BY 
    bonus_status;



-- Total vacation days used by type
SELECT vacation_type, 
    vacation_status, 
	SUM(DATEDIFF(day, start_date, end_date)) AS total_days_used
FROM vacations
GROUP BY  vacation_type, vacation_status;

-- Total loans by status
SELECT loan_status, SUM(loan_amount) AS total_loans
FROM loans
GROUP BY  loan_status;



-- Total overtime hours department
SELECT d.department_name, 
    SUM(o.hours_overtime) AS total_overtime_hours
FROM departments d
JOIN employees e
	ON d.id = e.department_id
JOIN overtime o 
	ON e.id = o.employee_id
GROUP BY 
    d.department_name;
