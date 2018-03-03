create procedure api.usp_PaymentTypeInsert(
	@psName nvarchar(30)
)
as
begin 
	insert dbo.t_dicPaymentTypes(sName) values (@psName);
end