create view olap.v_dimPlaces
as
select
	nId
	,sName
	,sAddress
from
	migration.t_dicPlaces