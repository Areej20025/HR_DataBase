-- Step 1: Create Master Key for encryption
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword!123';

--Create certificate to use for data encryption

CREATE CERTIFICATE MyCert WITH SUBJECT = 'My Data Encryption Certificate';

-- Step2: Create a symmetric key
CREATE SYMMETRIC KEY MySymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MyCert;


-- Open the symmetric key to use it

OPEN SYMMETRIC KEY MySymmetricKey
DECRYPTION BY CERTIFICATE MyCert;

--
--Add encrypted salary column
ALTER TABLE payroll
ADD encrypted_net_salary varbinary(MAX);

-- Encrypt net_salary and save it in the new column
UPDATE payroll
SET encrypted_net_salary = ENCRYPTBYKEY(KEY_GUID('MySymmetricKey'), CAST(net_salary AS VARCHAR(50)));


-- View encrypted salary

SELECT encrypted_net_salary
FROM payroll;

--
--Decrypt the encrypted salary back to decimal
SELECT 
    CONVERT(DECIMAL(10, 2), CONVERT(VARCHAR(50), DECRYPTBYKEY(encrypted_net_salary))) AS decrypted_net_salary
FROM payroll;
-- Close the symmetric key after use
CLOSE SYMMETRIC KEY MySymmetricKey;
