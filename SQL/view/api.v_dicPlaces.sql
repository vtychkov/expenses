create view api.v_dicPlaces
as 
select dbo.t_dicPlaces.sName, dbo.t_dicPlaces.sAddress
from dbo.t_dicPlaces;