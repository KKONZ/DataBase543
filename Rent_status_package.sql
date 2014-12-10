create or replace package rent_status_package as
type datetabtype is table of date index by binary_integer;
type chartabtype is table of char(1) index by binary_integer;
type rowidtabtype is table of rowid index by binary_integer;

rent_date_tab datetabtype;
return_date_tab datetabtype;
last_accrual_tab datetabtype;
rowid_tab rowidtabtype;
changed_balance chartabtype;
start_date_tab_size binary_integer;
end;
/
show errors
