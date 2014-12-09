
DROP TABLE Rent_Status
CASCADE CONSTRAINT;

CREATE TABLE Rent_Status(
Rent_ID VARCHAR2(10) CONSTRAINT Rent_ID_PK PRIMARY KEY,
Rent_Date DATE,
Return_Date DATE,


--- new column to keep track of accrual dates
last_accrual DATE;


Rent_code VARCHAR2(10),
CONSTRAINT Rent_Code_FK1 FOREIGN KEY(Rent_Code) REFERENCES Rental_Code(Rent_Code),
Vid_ID VARCHAR2(10),
CONSTRAINT Vid_ID_FK2 FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
Mem_ID VARCHAR2(10),
CONSTRAINT Mem_ID_FK3 FOREIGN KEY (Mem_ID) REFERENCES
Member(Mem_ID));



INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Vid_ID, Mem_ID)
VALUES
('R007', '07-Dec-2014', 'V001', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Vid_ID, Mem_ID)
VALUES
('R008', '08-Dec-2014’', 'V005', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Vid_ID, Mem_ID)
VALUES
('R009', '09-Dec-2014', 'V006', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Vid_ID, Mem_ID)
VALUES
('R010', '08-Dec-2014', 'V007', 'M002');








--- after test 
delete Rent_Status where Rent_ID = 'R007';
delete Rent_Status where Rent_ID = 'R008';
delete Rent_Status where Rent_ID = 'R009';
delete Rent_Status where Rent_ID = 'R010';


