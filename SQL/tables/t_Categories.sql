create table t_Categories (
nId smallint identity(1,1) NOT NULL,
sName nvarchar(50) NOT NULL,
CONSTRAINT PK_t_Categories PRIMARY KEY(nId)
)