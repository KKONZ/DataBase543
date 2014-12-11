create or replace package Rent_pkg
 as 
    type rid_Array is table of rowid index by binary_integer; 

  newRows rid_Array; 
   empty   rid_Array; 

  end; 
  / 
