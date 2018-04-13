delete from dbo.t_dicPaymentTypes;

set identity_insert dbo.t_dicPaymentTypes on;
insert into dbo.t_dicPaymentTypes(
	nId
	,sName
)
values
	(1, N'Наличный')
	,(2, N'Безналичный');

set identity_insert dbo.t_dicPaymentTypes off;