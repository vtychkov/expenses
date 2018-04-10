create procedure migration.usp_PaymentTypeCopy
	as
begin 
	insert migration.t_dicPaymentTypes(sName) 
	select d.sName
		from [dbo].[t_dicPaymentTypes] d
	where d.nId not in (select m.nId from [migration].[t_dicPaymentTypes] m)
	
end

