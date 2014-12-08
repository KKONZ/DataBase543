
create or replace trigger late_fee_trg

before insert on rent_status for each row

declare rent_length binary_Integer;

begin

SELECT sum(TRUNC(sysdate) - TRUNC(rent_date)) into rent_length 

FROM rent_status, member

where member.mem_id = rent_status.mem_id

and return_date IS Null 

and rent_status.mem_id =:new.mem_id;


if (rent_length) > 2 then

update

member 

set balance = (rent_length * 2);

else 

dbms_output.put_line('no new charges');

end if;

end;

/

show errors

