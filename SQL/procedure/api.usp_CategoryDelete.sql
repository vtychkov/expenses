create procedure api.usp_CategoryDelete(
	@pnId smallint
)
as 
begin
	delete from dbo.t_dicCategories where nId = @pnId;
end