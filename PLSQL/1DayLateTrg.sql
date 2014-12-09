create or replace trigger late_fee_new_rls_trg
before insert or update on rent_status for each row
declare rent_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC001';
 
if (rent_length) > 1 
then
update
member
set balance = balance +  (rent_length * 2)
where mem_id=:new.mem_id;
else
dbms_output.put_line('no new charges');
end if;
end;
/


select * from member;

/*
run below if need to reset member balances to zero
*/

update member set balance =0 where mem_id ='M001';
update member set balance =0 where mem_id ='M002';
update member set balance =0 where mem_id ='M003';
update member set balance =0 where mem_id ='M004';
update member set balance =0 where mem_id ='M005';
