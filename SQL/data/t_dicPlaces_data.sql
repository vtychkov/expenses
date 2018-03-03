set identity_insert dbo.t_dicPlaces on;
insert into dbo.t_dicPlaces(
	nId
	,sName
	,sAdress
)
values 
	(1, N'Глобус', N'дядково'),
	(2, N'Лента', N'тимуровцев'),
	(3, N'Шайба', N'есенина'),
	(4, N'Апельсин', N'есенина');
set identity_insert dbo.t_dicPlaces off;