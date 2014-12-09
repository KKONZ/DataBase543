update Member 
set Balance = 50
where Mem_ID = 'M002';

---this example should throw an error
insert into Rent_Status (Rent_ID, Rent_Date, Mem_ID) VALUES ('R007',sysdate, 'M002');


---this example should go through
insert into Rent_Status (Rent_ID, Rent_Date, Mem_ID) VALUES ('R007',sysdate, 'M003');



/*

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
run after demo

*/


DELETE Rent_Status where Rent_ID = 'R007';
