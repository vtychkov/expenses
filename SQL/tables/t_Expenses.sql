create table t_Expenses (
nId int identity(1,1) NOT NULL,
dtDate datetime2 NOT NULL,
nUserId int NOT NULL,
nCategorieId smallint NOT NULL,
nPlaceId smallint NOT NULL,
nPaymentTypeId tinyint NOT NULL,
dSum decimal (24,4) NOT NULL,
CONSTRAINT PK_t_Expenses PRIMARY KEY(nId),
CONSTRAINT FK_t_Expenses_t_UsersId FOREIGN KEY (nUserId) REFERENCES t_Users(nId),
CONSTRAINT FK_t_Expenses_t_PlacesId FOREIGN KEY(nPlaceId ) REFERENCES t_Places(nId),
CONSTRAINT FK_t_Expenses_t_PaymentTypesId FOREIGN KEY(nPaymentTypeId ) REFERENCES t_PaymentTypes(nId),
CONSTRAINT FK_t_Expenses_t_CategoriesId FOREIGN KEY(nCategorieId ) REFERENCES t_Categories(nId)
)
