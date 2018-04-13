delete from dbo.t_dicPlaces;

set identity_insert dbo.t_dicPlaces on;
insert into dbo.t_dicPlaces(
	nId
	,sName
	,sAddress
)
values 
	(1, N'Глобус', N'Большая')
	,(2, N'Лента', N'Тимуровцев')
	,(3, N'Шайба', N'Есенина')
	,(4, N'Апельсин', N'Есенина');

set identity_insert dbo.t_dicPlaces off;