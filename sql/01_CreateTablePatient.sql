--SQL keywords -> UPPERCASE
--Table names, Column names -> PascalCase

DROP TABLE Patients;
GO
CREATE TABLE Patients
(
	PatientID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	BirthDate DATE NOT NULL,
	Gender VARCHAR(50) CHECK(Gender IN('Male','Female','Other')),
	PhoneNumber VARCHAR(50),
	Email VARCHAR(100) UNIQUE
);
-- identity(1,1) = start with 1, increase by 1 
-- CHECK (_field IN(..,..,..,)) = only allow to select between those values
-- unique = no duplicate
-- SSMS command GO = finish this batch 
GO 

--add field MRN medical record number
ALTER TABLE Patients
ADD MRN VARCHAR(20) NOT NULL;

--make field MRN unique
ALTER TABLE Patients
ADD CONSTRAINT UQ_Patients_MRN UNIQUE(MRN);

--to see all the constraints in a table
exec sp_help 'Patients';

--drop constraints because i didnot name them properly  
ALTER TABLE Patients
DROP CONSTRAINT CK__Patients__Gender__534D60F1;

ALTER TABLE Patients
DROP CONSTRAINT UQ__Patients__A9D10534AA502BDC;

ALTER TABLE Patients
ADD CONSTRAINT CK_Patients_Gender CHECK(Gender IN('Male','Female','Other'));

ALTER TABLE Patients
ADD CONSTRAINT UQ_Patients_Email UNIQUE(Email);

