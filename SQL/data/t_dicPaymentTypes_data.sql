set identity_insert dbo.t_dicPaymentTypes on;
insert into dbo.t_dicPaymentTypes(
	nId
	,sName
)
values
	(1, N'наличные'),
	(2, N'безналичные');

set identity_insert dbo.t_dicPaymentTypes off;