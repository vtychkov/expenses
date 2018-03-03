create procedure api.usp_InsertCategorie(@psName nvarchar(50), @pnParentId smallint)
as begin
insert dbo.t_Categories (sName,nParentId) values (@psName,@pnParentId);
end