create view olap.v_fct_measure
as
select 
	cast(format (ex.dtDate, 'yyyyMMdd' )as int) as nDateId
	,nUserId
	,nCategoryId
	,nPlaceId 
	,nPaymentTypeId 
	,ex.dSum
from migration.t_Expenses ex

