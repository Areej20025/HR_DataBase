--Full Backup of HR
BACKUP DATABASE [HR]
TO DISK = 'C:\Backups\HR_Full.bak'
WITH FORMAT,
MEDIANAME = 'SQLServerBackups',
NAME = 'Full Backup of HR';

--Differential Backup
BACKUP DATABASE [HR]
TO DISK = 'C:\Backups\HR_Differential.bak'
WITH DIFFERENTIAL,
MEDIANAME = 'SQLServerBackups',
NAME = 'Differential Backup of HR';


--Transaction Log Backup
BACKUP LOG [HR]
TO DISK = 'C:\Backups\HR_LogBackup.trn'
WITH MEDIANAME = 'SQLServerBackups',
NAME = 'Transaction Log Backup of HR';

--Partial Backup
BACKUP DATABASE [HR]
TO DISK = 'C:\Backups\HR_PartialBackup.bak'
WITH PARTIAL,
MEDIANAME = 'SQLServerBackups',
NAME = 'Partial Backup of HR';


