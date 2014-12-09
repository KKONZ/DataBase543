drop trigger late_fee_new_rls_trg

--- load trigger late_Fee_3day_trg then

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R300', '04-Dec-2014', 'RC003', 'V002', 'M004');

select * from Rent_Status;
Select * from Member;

Insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Vid_Id, Mem_ID)
VALUES
('R301', sysdate, 'RC003', 'V004', 'M004');

select * from Rent_Status;
Select * from Member;

delete Rent_Status where Rent_ID = 'R300';
delete Rent_Status where Rent_ID = 'R301';
