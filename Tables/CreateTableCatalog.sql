CREATE TABLE Catalog(

Cat_ID VARCHAR2(10) CONSTRAINT Cat_PK PRIMARY KEY,

Title VARCHAR2(25),

Category VARCHAR2(25),

Release_Date DATE,

Rent_Code VARCHAR2(10),

CONSTRAINT  Rent_Code_FK FOREIGN KEY (Rent_Code) REFERENCES Rental_Code(Rent_Code));
