set identity_insert dbo.t_dicUsers on;
insert into dbo.t_dicUsers(
	nId
	,sSurname
	,sName
	,dtBirthday
	,sPhone
	,sEmail
)
values
	(1, N'Иванов', N'Иван' ,'19951017','+79206954854','ivanvan@mm.ru'),
	(2, N'Петров', N'Михаил' ,'19870613','+79206563142','mixmix@mm.ru'),
	(3, N'Душин', N'Дмитрий', '19920327','+79206314759','duhduh@mm.ru'),
	(4, N'Степанов', N'Алексей', '19821103','+79206367415','stepa@mm.ru'),
	(5, N'Савин', N'Василий', '19830817','+792036974512','savin@mm.ru'),
	(6, N'Аксенов', N'Денис', '19760825','+79203614753','aksen@mm.ru'),
	(7, N'Туманов', N'Иван', '19880114','+79203697412','tuman@mm.ru'),
	(8, N'Петров', N'Алексей','19931017','+79202596431','petalxei@mm.ru'),
	(9, N'Рубцов', N'Дмитрий','19900603','+79203145601','rubdm@mm.ru'),
	(10, N'Карташов', N'Николай', '19871007','+79203697546','kartn@mm.ru');
set identity_insert dbo.t_dicUsers off;
