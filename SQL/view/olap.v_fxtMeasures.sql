alter view olap.v_fctMeasures
as
select 
	cast(format (ex.dtDate, 'yyyyMMdd' )as int) as nDateId
	,nUserId
	,nCategoryId
	,nPlaceId 
	,cast(nPaymentTypeId as smallint) as nPaymentTypeId
	,ex.dSum
from migration.t_Expenses ex