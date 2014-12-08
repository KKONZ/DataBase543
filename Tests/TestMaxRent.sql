--- this tests MaxRent_trg
--- This is for business rule 1 

---This will throw an error by default database from scripts

insert into Rent_Status (Rent_ID, Rent_Date, Mem_ID) VALUES ('R007',sysdate, 'M001');


--- this should code should go through fine

insert into Rent_Status (Rent_ID, Rent_Date, Mem_ID) VALUES ('R007',sysdate, 'M002');
