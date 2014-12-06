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
