create procedure api.usp_PaymentTypeDelete(
	@pnId tinyint
)
as
begin 
	delete from dbo.t_dicPaymentTypes where nId = @pnId;
end