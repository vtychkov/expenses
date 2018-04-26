create procedure migration.usp_PaymentTypeLoad
	as
begin 
	insert migration.t_dicPaymentTypes(sName) 
	select d.sName
		from dbo.t_dicPaymentTypes d left join migration.t_dicPaymentTypes m on d.nId=m.nId
		where m.nId is null
	
end

