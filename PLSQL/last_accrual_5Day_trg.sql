create or replace trigger last_accrual_5Day_trg
before insert on rent_status for each row
declare rent_length binary_Integer;
declare accrual_length binary_Integer;
begin
SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length
FROM rent_status
where return_date IS Null
and mem_id =:new.mem_id
and rent_code = 'RC005';
  if last_accrual IS NOT NULL;
    select sum(TRUNC(sysdate)-TRUNC(Last_accrual)) into accrual_length
   
    --- May to identify these again but probably not...
    /*
    from rent_status
    where return_date IS Null;
    and mem_id=:new.mem_id
    and rent_code = 'R005';
    */
    
    update 
    member
    set balance = balance +(accrual_length*2)
    where mem_id=:new.mem_id;
    
    update
    rent_status
    set last_accrual = sysdate
    where mem_id=:new.mem_id;
 
 elsif (rent_length) >5 then
    
    update
    member
    set balance = balance +  (rent_length * 2)
    where mem_id=:new.mem_id;
    
    update
    rent_status
    set last_accrual = sysdate
    where mem_id=:new.mem_id;
    
    dbms_output.put_line('You have a past due rental that needs to be returned');
  else
dbms_output.put_line('no new charges');
end if;
end;
/
show errors
