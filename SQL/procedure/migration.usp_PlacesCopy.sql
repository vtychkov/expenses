create procedure migration.usp_PlacesCopy
	as
begin 
	insert migration.t_dicPlaces(sName, sAddress) 
	select d.sName, d.sAddress
		from [dbo].[t_dicPlaces] d
	where d.nId not in (select m.nId from [migration].[t_dicPlaces] m)
	
end

