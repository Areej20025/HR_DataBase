USE HR;

--CReate role for data analysts
CREATE ROLE data_analyst;

-- Login for Areej
CREATE LOGIN Areej
WITH PASSWORD = 'passwordforareej1234';

-- Create user for Areej and link to login
CREATE USER Areej 
FOR LOGIN Areej;

-- Add Areej to data_analyst role
ALTER ROLE data_analyst 
ADD MEMBER Areej;

---Remove Areej from the data_analyst role
ALTER ROLE data_analyst
   DROP MEMBER Areej;

-- Grant permissions (UPDATE, SELECT) on employees to data_analyst
GRANT UPDATE, SELECT ON employees TO data_analyst;

-- Revoke UPDATE permission from data_analyst on employees
REVOKE UPDATE 
ON employees
 FROM data_analyst;

-- Role for report viewers
CREATE ROLE report_viewer;

---Grant SELECT on employees to report_viewer
GRANT SELECT ON employees TO report_viewer;

-- Create login for Ahmed
CREATE LOGIN Ahmed WITH PASSWORD = 'passwordforahmed1234';

--User for Ahmed linked to login
CREATE USER Ahmed FOR LOGIN Ahmed;

-- Add Ahmed to report_viewer role
ALTER ROLE report_viewer ADD MEMBER Ahmed;

-- Check permissions for data_analyst
EXEC sp_helprotect NULL, 'data_analyst';

-- Check Areej permissions
EXEC sp_helprotect NULL, 'Areej';

-- Revoke SELECT from data_analyst on employees
REVOKE SELECT ON employees FROM data_analyst;

-- Drop Areej user
DROP USER Areej;

-- Drop Areej login
DROP LOGIN Areej;

