create table t_Places (
nId smallint identity(1,1) NOT NULL,
sName nvarchar (100) NOT NULL,
sAdress nvarchar (100),
CONSTRAINT PK_t_Places PRIMARY KEY(nId)
)