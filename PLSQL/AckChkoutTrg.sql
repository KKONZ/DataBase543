CREATE OR REPLACE TRIGGER  Chkout_Message_Trg
after insert on Rent_Status 
For each row

BEGIN
 --- prints from the server
DBMS_OUTPUT.PUT_LINE('Check out is complete, thank you!');

End;
/ 
show errors
