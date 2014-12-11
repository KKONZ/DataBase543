create or replace package Rent_pkg
 as 
    type ridArray is table of rowid index by binary_integer; 

  newRows ridArray; 
   empty   ridArray; 

  end; 
  / 
