create table t_PaymentTypes (
nId tinyint identity(1,1) NOT NULL,
sName nvarchar (30) NOT NULL,
CONSTRAINT PK_t_PaymentTypes PRIMARY KEY(nId)
)