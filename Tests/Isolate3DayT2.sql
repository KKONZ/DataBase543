insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Mem_ID) VALUES ('R007',sysdate, 'RC005', 'M001');


select * from member;
select * from rent_status;

delete on Rent_status where Rent_ID = 'R007';


---load triggers for rc 1, 3, 5

insert into Rent_Status (Rent_ID, Rent_Date, Rent_Code, Mem_ID) VALUES ('R007',sysdate, 'RC005', 'M001');


select * from member;
select * from rent_status;

delete on Rent_status where Rent_ID = 'R007';
