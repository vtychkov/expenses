alter view olap.v_dimPaymentTypes
as
select
	cast(nId as smallint) as nId
	,sName
from
	migration.t_dicPaymentTypes