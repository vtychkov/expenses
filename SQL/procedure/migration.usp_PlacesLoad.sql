create procedure migration.usp_Placesload
	as
begin 
	insert migration.t_dicPlaces(sName, sAddress) 
	select d.sName, d.sAddress
		from dbo.t_dicPlaces d left join migration.t_dicPlaces m on d.nId=m.nId
		where m.nId is null
		
end

