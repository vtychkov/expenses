alter table t_dicCategories add constraint PK_t_dicCategories_nId primary key(nId);

alter table t_dicPlaces add constraint PK_t_dicPlaces_nId primary key(nId);
alter table t_dicUsers add constraint PK_t_dicUsers_nId primary key(nId);
alter table t_dicPaymentTypes add constraint PK_t_dicPaymentTypes_nId primary key(nId);
alter table t_Expenses add constraint PK_t_Expenses_nId primary key(nId);

alter table t_dicCategories add constraint FK_t_dicCategories_t_dicCategories foreign key(nParentId) references t_dicCategories(nId);

alter table t_Expenses add constraint FK_t_Expenses_t_dicUsers foreign key (nUserId) references t_dicUsers(nId);
alter table t_Expenses add constraint FK_t_Expenses_t_dicPlaces foreign key(nPlaceId) references t_dicPlaces(nId);
alter table t_Expenses add constraint FK_t_Expenses_t_dicPaymentTypes foreign key(nPaymentTypeId) references t_dicPaymentTypes(nId);
alter table t_Expenses add constraint FK_t_Expenses_t_dicCategories foreign key(nCategoryId) references t_dicCategories(nId);
alter table t_Expenses add constraint FK_t_Expenses_t_dicCategories foreign key(nCategoryId) references t_dicCategories(nId); 