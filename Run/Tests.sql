

---test 1 series one:

select * from member;
select * from rent_status;

INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R010', '18-Oct-2014', 'RC001', 'V001', 'M001');



select * from member;

--- shows trigger for new release late fee dates and amounts

select * from rent_status;


--- shows exception for max fine
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R011', '18-Oct-2014', 'RC001', 'V001', 'M001');

select * from member;
select * from rent_status;

---shows max balance

INSERT INTO Rent_Status 


(Rent_id, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R012', '18-Nov-2014', 'RC003', 'V001', 'M002');

select * from member;






---show automated from balance for 3 day rentals and max balance

select * from rent_status;

---shows max balance
INSERT INTO Rent_Status 
(Rent_ID,Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R013', sysdate, 'RC001', 'V001', 'M002');
select * from member;
---shows 3 day rental trigger
select*from member;







--- test 5 day rental trigger

INSERT INTO Rent_Status 
(Rent_ID,Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R014', '18-Nov-14', 'RC005', 'V001', 'M003');
select * from member;
select * from rent_status;

--- shows 5 day rental balance update

INSERT INTO Rent_Status 
(Rent_ID,Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R015', sysdate, 'RC005', 'V001', 'M003');
select * from member;
select * from rent_status;


--- The following scripts are to run after accruals so it would ignore
--- the rent date if a video has already been accrued. 
--- These are designed to avoid compounding late fees on an account if they continue 
--- to be past due.


--- The easiest way to test this is to change the system times on whatever computer
--- you are working on, please see included screen shots.



--- reset the rent history to its default settings:



drop table rent_status 
cascade constraints;
DROP TABLE Member
CASCADE CONSTRAINT;


CREATE TABLE Member(
	Mem_ID VARCHAR2(10) CONSTRAINT Mem_ID_PK PRIMARY KEY,
	Mem_Fn VARCHAR2(25),
	Mem_Ln VARCHAR2(25),
	Mem_City VARCHAR2(25),
	Mem_area CHAR(3),
	Mem_Phn CHAR(7),
	Regtr_Dt DATE,
Balance NUMBER(10,2));



CREATE TABLE Rent_Status(
Rent_ID VARCHAR2(10) CONSTRAINT Rent_ID_PK PRIMARY KEY,
Rent_Date DATE,
Return_Date DATE,
last_accrual_1 DATE,
last_accrual_3 DATE,
last_accrual_5 DATE,
Rent_code VARCHAR2(10),
CONSTRAINT Rent_Code_FK1 FOREIGN KEY(Rent_Code) REFERENCES Rental_Code(Rent_Code),
Vid_ID VARCHAR2(10),
CONSTRAINT Vid_ID_FK2 FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
Mem_ID VARCHAR2(10),
CONSTRAINT Mem_ID_FK3 FOREIGN KEY (Mem_ID) REFERENCES
Member(Mem_ID));

--- note members are still charged $10 for membership

INSERT INTO Member
(Mem_ID, Mem_Fn, Mem_Ln, Mem_City,Mem_area, Mem_Phn, Regtr_Dt, balance)
VALUES
('M001', 'Joe', 'Johnson', 'St. Cloud', '320', '3333331', '18-Oct-1993', 10);
INSERT INTO Member
(Mem_ID, Mem_Fn, Mem_Ln, Mem_City,Mem_area, Mem_Phn, Regtr_Dt, balance)
VALUES
('M002', 'Ben', 'Anderson', 'Sauk Rapids', '320', '3333332', '18-Oct-1993', 10);
INSERT INTO Member
(Mem_ID, Mem_Fn, Mem_Ln, Mem_City,Mem_area, Mem_Phn, Regtr_Dt, balance)
VALUES
('M003', 'Dave', 'Larson', 'Waite Park', '320', '3333333', '20-Oct-1993', 10);
INSERT INTO Member
(Mem_ID, Mem_Fn, Mem_Ln, Mem_City,Mem_area, Mem_Phn, Regtr_Dt, balance)
VALUES
('M004', 'Barbara', 'Hoffman', 'Little Falls', '320', '3333334', '4-Apr-1993', 10);
INSERT INTO Member
(Mem_ID, Mem_Fn, Mem_Ln, Mem_City,Mem_area, Mem_Phn, Regtr_Dt, balance)
VALUES
('M005', 'Donna', 'Pearson', 'Sartell', '763', '3333335', '6-Jul-1993', 10);





--- set 1st checkouts in October instead of December:


INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R001', '01-Oct-2014', 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R002', '01-Oct-2014', 'RC003', 'V003', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R003', '01-Oct-2014', 'RC005', 'V004', 'M003');




select * from member;
select * from rent_status;



--- Operating System Needs to have its date reset to a prior date, more than 
--- 5 days in the past. The accrual triggers update by sysdate.

--- see documentation 
--- Note screen shots have system reset date set to 08-Oct-14, 



INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R004', Sysdate, 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R005', sysdate, 'RC003', 'V003', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R006', sysdate, 'RC005', 'V004', 'M003');
select * from member;
select * from rent_status;


--- This is what you would run if you change your sysdate to 08-Oct-14
--- Note this has a check to make sure that you actually changed your sysdate
--- I tried to do this on a Windows 7 machine and even though I was able to change 
--- the operating sysdate oracle still recognized the current date so when I selected 
--- all from rent_status it was showing 14-Dec-14 not 08-Oct-14 which is what my operating system
--- date was set to.


INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R007', Sysdate, 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R008', sysdate, 'RC003', 'V003', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R009', sysdate, 'RC005', 'V004', 'M003');



-- Then run again again after resetting to another future date

INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R010', Sysdate, 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R011', sysdate, 'RC003', 'V003', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R012', sysdate, 'RC005', 'V004', 'M003');


