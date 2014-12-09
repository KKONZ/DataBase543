--- select * from user_objects;

--- make sure that 1Day trigger is the only rent code trigger
--- delete trigger;

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R100', '04-Dec-2014', 'RC001', 'V002', 'M004');

select * from Rent_Status;
Select * from Member;

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R100', '04-Dec-2014', 'RC001', 'V002', 'M004');

select * from Rent_Status;
Select * from Member;
