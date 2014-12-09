create or replace trigger last_accrual_nrls_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
declare accrual_length binary_Integer;
begin

SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC001';
 if (rent_length) > 1 then 
     if last_accrual IS NULL 
      update
      member
      set balance = balance +  (rent_length * 2)
      where mem_id=:new.mem_id;
     else
      sum(TRUNC(sysdate)-TRUNC(Last_accrual)) into accrual_length;
      update 
      member
      set balance = balance +(accrual_length*2)
      where mem_id=:new.mem_id;
  else
dbms_output.put_line('no new charges');
end if;
end;
/
