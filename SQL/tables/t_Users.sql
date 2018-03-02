CREATE TABLE t_Users (
nId int identity(1,1) NOT NULL,
sSurname nvarchar (100),
sName nvarchar (100) NOT NULL,
dtBirthday date,
sPhone varchar (20),
sEmail varchar (100)
CONSTRAINT PK_t_Users PRIMARY KEY(nId)
)






