create table migration.t_Expenses(
	nId int  NOT NULL
	,dtDate datetime2 NOT NULL
	,nUserId int NOT NULL
	,nCategoryId smallint 
	,nPlaceId smallint 
	,nPaymentTypeId tinyint NOT NULL
	,dSum decimal(24,4) NOT NULL
);
