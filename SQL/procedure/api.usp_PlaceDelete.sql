create procedure api.usp_PlaceDelete(
	@pnId smallint
)
as
begin
	delete from dbo.t_dicPlaces where nId = @pnId;
end