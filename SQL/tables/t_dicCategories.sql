create table dbo.t_dicCategories (
	nId smallint identity(1,1) NOT NULL
	,sName nvarchar(50) NOT NULL
	,nParentId smallint
);