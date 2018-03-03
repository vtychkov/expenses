set identity_insert dbo.t_dicCategories on;
insert into dbo.t_dicCategories(
	nId
	,sName
	,nParentId
)values
	(1, N'транспорт', null),
	(2, N'питание', null),
	(3, N'развлечения', null),
	(4, N'обучение', null),
	(5, N'комунальные', null),
	(6, N'техника', null),
	(7, N'строительство', null),
	(8, N'прочее', null),
	(9, N'бензин',1),
	(10, N'ремонт',1),
	(11, N'страхование',1),
	(12, N'мойка',1),
	(13, N'свет',5),
	(14, N'газ',5),
	(15, N'вода',5);
set identity_insert dbo.t_dicCategories off;
