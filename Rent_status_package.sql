SQL> create or replace package Rent_status_packag
  2  as 
  3          type rid_Array is table of rowid index by binary_integer; 
  4 
  4          newRows rid_Array; 
  5          empty   rid_Array; 
  6  end; 
  7  / 
Package created.
