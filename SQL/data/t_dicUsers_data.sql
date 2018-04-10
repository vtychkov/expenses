set identity_insert dbo.t_dicUsers on;
insert into dbo.t_dicUsers(
	
	sSurname
	,sName
	,dtBirthday
	,sPhone
	,sEmail
)
values

	(N'Михайлов', N'Сергей','19860803','+79203364711','mixqwm@mm.ru'),
	(N'Кочетков', N'Иван','19880717','+79203647512','kohds@mm.ru'),
	(N'Емельянов', N'Павел','19930102','+79203641274','emlp@mm.ru');
set identity_insert dbo.t_dicUsers off;
