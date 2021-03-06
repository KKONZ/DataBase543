
DROP TABLE Rent_Status
CASCADE CONSTRAINT;

CREATE TABLE Rent_Status(
Rent_ID VARCHAR2(10) CONSTRAINT Rent_ID_PK PRIMARY KEY,
Rent_Date DATE,
Return_Date DATE,

--- new column to keep track of accrual dates
last_accrual DATE,

Rent_code VARCHAR2(10),
CONSTRAINT Rent_Code_FK1 FOREIGN KEY(Rent_Code) REFERENCES Rental_Code(Rent_Code),
Vid_ID VARCHAR2(10),
CONSTRAINT Vid_ID_FK2 FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
Mem_ID VARCHAR2(10),
CONSTRAINT Mem_ID_FK3 FOREIGN KEY (Mem_ID) REFERENCES
Member(Mem_ID));






INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R007', '07-Dec-2014', 'RC001', 'V001', 'M002');

INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R008', '08-Dec-2014', 'RC003', 'V001', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R009', '09-Dec-2014','RC005', 'V001', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R010', '08-Dec-2014','RC001', 'V001', 'M002');

INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R011', '08-Dec-2014','RC001', 'V001', 'M002');

---- pause make sure trigger is loaded

--- after test 
delete Rent_Status where Rent_ID = 'R007';
delete Rent_Status where Rent_ID = 'R008';
delete Rent_Status where Rent_ID = 'R009';
delete Rent_Status where Rent_ID = 'R010';
delete Rent_Status where Rent_ID = 'R011';
delete Rent_Status where Rent_ID = 'R012';
---pause make sure trigger is loaded
