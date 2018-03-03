create procedure api.usp_InsertPaymentType (@psName nvarchar(30))
as begin 
insert dbo.t_PaymenTypes (sName) values (@psName)
end