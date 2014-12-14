--- Group Project ---
--- Karl Konz, Sujitha Dandu, Jena Pung


SET SERVEROUTPUT ON

DROP TABLE Staff
CASCADE CONSTRAINT;
DROP TABLE Branch
CASCADE CONSTRAINT;
DROP TABLE Rental_Code
CASCADE CONSTRAINT;
DROP TABLE Catalog
CASCADE CONSTRAINT;
DROP TABLE Video
CASCADE CONSTRAINT;
DROP TABLE Member
CASCADE CONSTRAINT;
DROP TABLE Rent_Status
CASCADE CONSTRAINT;


CREATE TABLE Staff(
	Staff_ID VARCHAR2(10) CONSTRAINT Staff_PK PRIMARY KEY,
	Staff_Fn VARCHAR2(25),
	Staff_Ln VARCHAR2(25),
	Staff_City VARCHAR2(25),
	Staff_area CHAR(3),
	Staff_Phone CHAR(7),
	Position VARCHAR2(25),
            Salary NUMBER(2)
);


CREATE TABLE Branch(
	Branch_ID VARCHAR2(10) CONSTRAINT Branch_PK PRIMARY KEY,
	Branch_ZIP CHAR(5),
	Branch_area CHAR(3),
	Branch_Phone CHAR(7),
	Manager VARCHAR2(8),
CONSTRAINT  Branch_FK FOREIGN KEY(Manager) REFERENCES Staff(Staff_ID)) ;
	
CREATE TABLE Rental_Code(
	Rent_Code VARCHAR2(10) CONSTRAINT Rental_Code_PK PRIMARY KEY,
	Rent_Fee NUMBER(4, 2));


CREATE TABLE Catalog(
Cat_ID VARCHAR2(10) CONSTRAINT Cat_PK PRIMARY KEY,
Title VARCHAR2(25),
Category VARCHAR2(25),
Release_Date DATE);

CREATE TABLE Video(
Vid_ID VARCHAR2(10) CONSTRAINT Vid_ID_PK PRIMARY KEY,
Cat_ID VARCHAR2(10),
 	CONSTRAINT Cat_ID_FK FOREIGN KEY (Cat_ID) REFERENCES Catalog(Cat_ID)
) ;

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


INSERT INTO Staff 
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
VALUES 
('S001','Becky',' Johnson', 'Manager', 'St.Cloud', '320', '5555555', 15);
INSERT INTO Staff 
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
VALUES 
('S002', 'Sarah', 'Anderson', 'Manager', 'Sauk Rapids', '320', '5555557', 15);
INSERT INTO Staff 
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
VALUES
('S003', 'Randy', 'Goodman', 'Manager', 'Sartell', '320', '5555558', 15);
INSERT INTO Staff 
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
VALUES
('S004', 'Susan', 'Rodriguez', 'Manager', 'Waite Park', '320', '5555559', 15);
INSERT INTO Staff
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
 VALUES
('S005', 'Robert', 'Mann', 'Manager', 'Little Falls', '320', '5555566', 15);
INSERT INTO Staff
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
 VALUES
('S006', 'Daniel', 'Monroe', 'Cashier', 'St Cloud', '763', '5555567', 10);
INSERT INTO Staff 
(Staff_ID, Staff_Fn, Staff_Ln, Position, Staff_City, Staff_area, Staff_Phone, Salary)
VALUES
('S007', 'Laura', 'Baker', 'Cashier', 'Sartell', '651', '5555568', 10);




INSERT INTO Branch
(Branch_ID, Branch_Zip, Branch_area, Branch_phone, Manager)
VALUES
('B001', '56377', '320', '1111111', 'S001');
INSERT INTO Branch
(Branch_ID, Branch_Zip, Branch_area, Branch_phone, Manager)
VALUES
('B002', '56301', '320', '1111112', 'S002');
INSERT INTO Branch
(Branch_ID, Branch_Zip, Branch_area, Branch_phone, Manager)
VALUES
('B003', '56387', '320', '1111113', 'S003');
INSERT INTO Branch
(Branch_ID, Branch_Zip, Branch_area, Branch_phone, Manager)
VALUES
('BB004', '56379', '320', '1111114', 'S004');
INSERT INTO Branch
(Branch_ID, Branch_Zip, Branch_area, Branch_phone, Manager)
VALUES
('B005', '56345', '320', '1111115', 'S005');

INSERT INTO Rental_Code 
(Rent_Code, Rent_Fee)
VALUES
('RC001', 3.97);
INSERT INTO Rental_Code 
(Rent_Code, Rent_Fee)
VALUES
('RC003', 1.99);
INSERT INTO Rental_Code 
(Rent_Code, Rent_Fee)
VALUES
('RC005', 2.59);


INSERT INTO Catalog
(Cat_ID, Title, Category)
VALUES
('C001', 'The Matrix', 'Action');
INSERT INTO Catalog
(Cat_ID, Title, Category)
VALUES
('C002', 'Frozen', 'Family');
INSERT INTO Catalog
(Cat_ID, Title, Category)
VALUES
('C003', 'Mirror', 'Horror');
INSERT INTO Catalog
(Cat_ID, Title, Category)
VALUES
('C004', 'Liar Liar', 'Comedy');


INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V001', 'C001');
INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V002', 'C002');
INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V003', 'C003');
INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V004', 'C003');
INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V005', 'C004');
INSERT INTO Video 
(Vid_ID, Cat_ID)
VALUES
('V006', 'C002');


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


INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R001', '11-DEC-2014', 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R002', '11-DEC-2014', 'RC001', 'V003', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R003', '11-DEC-2014', 'RC003', 'V004', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Return_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R004', '11-DEC-2014', '28-Oct-2014', 'RC003','V006', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R005', '11-DEC-2014','RC001', 'V002', 'M001');


COMMIT;

create or replace trigger late_fee1_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date+1)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_1 IS Null 
and mem_id =:new.mem_id
and rent_code = 'RC001';
if rent_length > 0 then
update
member 
set balance = balance + (rent_length*2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_1 = sysdate
where mem_id=:new.mem_id
and rent_code = 'RC001';
end if;
end;
/
show errors

create or replace trigger late_fee3_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date+3)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_3 IS NULL
and mem_id =:new.mem_id
and rent_code = 'RC003';
if rent_length >0 then
update
member 
set balance = balance + (rent_length * 2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_3 = sysdate
where mem_id=:new.mem_id
and rent_code = 'RC003';
end if;
end;
/
show errors


create or replace trigger late_fee5_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date+5)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_5 IS Null 
and mem_id =:new.mem_id
and rent_code = 'RC005';
if rent_length > 0 then
update
member 
set balance = balance + (rent_length * 2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_5 = sysdate
where mem_id=:new.mem_id
and rent_code = 'RC005';
end if;
end;
/
show errors


CREATE OR REPLACE TRIGGER MaxRent_Trg
before insert on Rent_Status For each row
Declare
 Rent_Check binary_integer;
 
BEGIN

 select count(Mem_ID) into Rent_Check
 FROM Rent_Status
WHERE Return_Date IS NULL and mem_id = :new.mem_id;

DBMS_OUTPUT.PUT_LINE(Rent_Check);
if (Rent_Check + 1)>5 then
 Raise_application_error(-20001, 'exceed max no of rentals allowed');
END IF;
End;
/ 
show error;






create or replace trigger balance_50

before insert on rent_status

for each row

declare

balance_check binary_integer;

begin

select balance into balance_check from member

where mem_id = :new.mem_id;

DBMS_OUTPUT.PUT_LINE(balance_check);

if balance_check >= 50 then

raise_application_error(-20100,'unpaid fee exceed');

end if;

end;

/
show error;


---accruals





create or replace trigger acc1_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual_1)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_1 IS NOT Null 
and mem_id =:new.mem_id;
 
if rent_length >0 then
update
member 
set balance = balance + (rent_length * 2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_1 = sysdate
where mem_id=:new.mem_id;
end if;
end;
/
show errors

create or replace trigger acc3_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual_3)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_3 IS NOT Null 
and mem_id =:new.mem_id;

if rent_length >0 then
update
member 
set balance = balance + (rent_length * 2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_3 = sysdate
where mem_id=:new.mem_id;
end if;
end;
/
show errors

create or replace trigger acc5_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(last_accrual_5)) into rent_length
FROM rent_status
where return_date IS Null 
and last_accrual_5 IS NOT Null 
and mem_id =:new.mem_id;

if rent_length >0 then
update
member 
set balance = balance + (rent_length * 2)
where mem_id=:new.mem_id;

update
rent_status
set last_accrual_5 = sysdate
where mem_id=:new.mem_id;
end if;
end;
/
show errors
