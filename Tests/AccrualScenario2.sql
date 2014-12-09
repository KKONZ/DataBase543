NSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Rent_Code, Vid_ID, Mem_ID)
VALUES
('R001', '18-Oct-2014', 'RC001', 'V001', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R002', '18-Oct-2014', 'RC001', 'V003', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R003', '18-Oct-2014', 'RC003', 'V004', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date, Return_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R004', '21-Oct-2014', '28-Oct-2014', 'RC003','V006', 'M002');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code,Vid_ID, Mem_ID)
VALUES
('R005', '18-Oct-2014','RC005', 'V002', 'M001');
INSERT INTO Rent_Status 
(Rent_ID, Rent_Date,Rent_Code, Vid_ID, Mem_ID)
VALUES
('R006', '18-Oct-2014','RC005', 'V005', 'M001');
COMMIT;
