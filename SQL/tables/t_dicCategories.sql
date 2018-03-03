create table t_Categories (
nId smallint identity(1,1) NOT NULL,
sName nvarchar(50) NOT NULL,
CONSTRAINT PK_t_Categories PRIMARY KEY(nId)
)
alter table t_Categories add nParentId smallint
alter table t_Categories ADD CONSTRAINT FK_t_Categories_nParentId
FOREIGN KEY (nParentId) REFERENCES t_Categories(nId)