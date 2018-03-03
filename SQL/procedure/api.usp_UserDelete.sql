create procedure api.usp_UserDelete(
	@pnId int
)
as 
begin
	delete from dbo.t_dicUsers where nId = @pnId;
end