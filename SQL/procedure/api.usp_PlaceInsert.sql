create procedure api.usp_PlaceInsert(
	@psName nvarchar(100)
	,@psAddress nvarchar(100)
)
as
begin
	insert dbo.t_dicPlaces(
		sName
		,sAddress
	) values (
		@psName
		,@psAddress
	);
end