create table dbo.t_dicUsers(
	nId int identity(1,1) NOT NULL
	,sSurname nvarchar(100)
	,sName nvarchar(100) NOT NULL
	,dtBirthday date
	,sSex char(1)
	,sPhone varchar(20)
	,sEmail varchar(100)
);