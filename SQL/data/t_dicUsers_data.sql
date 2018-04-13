delete from dbo.t_dicUsers;

set identity_insert dbo.t_dicUsers on;
insert into dbo.t_dicUsers(
	nId
	,sSurname
	,sName
	,dtBirthday
	,sPhone
	,sEmail
	,sSex
)
values
	(1, N'Иванов', N'Иван', '19951017', '+79206954854', 'ivani@mm.ru', 'M')
	,(2, N'Петров', N'Михаил', '19870613', '+79206563142', 'petm@mm.ru', 'M')
	,(3, N'Душин', N'Дмитрий', '19920327', '+79206314759', 'dushd@mm.ru', 'M')
	,(4, N'Степанова', N'Александра', '19821103', '+79206367415', 'stepa@mm.ru', 'F')
	,(5, N'Емельянова', N'Полина', '19930102', '+79203641274', 'emlp@mm.ru', 'F');

set identity_insert dbo.t_dicUsers off;
