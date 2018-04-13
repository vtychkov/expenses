delete from dbo.t_dicCategories;

set identity_insert dbo.t_dicCategories on;

insert into dbo.t_dicCategories(
	nId
	,sName
	,nParentId
)
values
	(1, N'Дом', null)
		,(11, N'ЖКХ', 1)
		,(12, N'Налог', 1)
	,(2, N'Питание', null)
	,(3, N'Транспорт', null)
		,(31, N'Бензин', 3)
		,(32, N'Ремонт', 3)
	,(4, N'Досуг', null)
		,(41, N'Кино', 4)
		,(42, N'Кафе', 4);

set identity_insert dbo.t_dicCategories off;
