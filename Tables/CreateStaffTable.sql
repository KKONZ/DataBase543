CREATE TABLE Staff(
    Staff_ID VARCHAR2(10) CONSTRAINT Staff_PK PRIMARY KEY,
    Staff_Fn VARCHAR2(25),
    Staff_Ln VARCHAR2(25),
    Staff_City VARCHAR2(25),
    Staff_area CHAR(3),
    Staff_Phone CHAR(7),
    Position VARCHAR2(25),
            Salary NUMBER(2)
);
