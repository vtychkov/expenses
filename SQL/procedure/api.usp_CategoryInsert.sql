create procedure api.usp_CategoryInsert(
	@psName nvarchar(50)
	,@pnParentId smallint
)
as 
begin
	insert into dbo.t_dicCategories(sName, nParentId) values (@psName, @pnParentId);
end