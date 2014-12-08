
create or replace trigger balance_50

before insert on rent_status

for each row

declare

balance_check binary_integer;

begin

select balance into balance_check  from member, rent_status

where member.mem_id = rent_status.mem_id;

DBMS_OUTPUT.PUT_LINE(balance_check);

if balance_check >= 50 then

raise_application_error(-20100,'unpaid fee exceed');

end if;

end;

/
show error;
