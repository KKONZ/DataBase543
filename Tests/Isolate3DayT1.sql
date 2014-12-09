drop trigger late_fee_new_rls_trg

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R300', '04-Dec-2014', 'RC001', 'V002', 'M004');

select * from Rent_Status;
Select * from Member;

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R301', sysdate, 'RC001', 'V004', 'M004');

select * from Rent_Status;
Select * from Member;
