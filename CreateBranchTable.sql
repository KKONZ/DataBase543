
CREATE TABLE Branch(
    Branch_ID VARCHAR2(10) CONSTRAINT Branch_PK PRIMARY KEY,
    Branch_ZIP CHAR(5),
    Branch_area CHAR(3),
    Branch_Phone CHAR(7),
    Manager VARCHAR2(8),
CONSTRAINT  Branch_FK FOREIGN KEY(Manager) REFERENCES Staff(Staff_ID)) ;

