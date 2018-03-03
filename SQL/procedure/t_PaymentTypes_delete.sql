create procedure api.usp_DeletePaymentType (@pnId tinyint)
as begin 
delete from dbo.t_PaymentTypes where nId=@pnId
end