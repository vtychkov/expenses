create procedure api.usp_InsertPlace (@psName nvarchar(100), @psAdress nvarchar(100))
as begin
insert dbo.t_Places (sName, sAdress) values (@psName, @psAdress)
end