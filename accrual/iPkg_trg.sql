create or replace trigger iPkg_trg
before insert or update on parent 
begin 
  rent_pkg.newRows := rent_pkg.empty; 
end; 
/ 
