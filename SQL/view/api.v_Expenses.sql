create view api.v_Expenses
as
select 
	convert (date, ex.dtDate) as dtDate,
	us.sSurname + ' ' + Us.sName as sUserName,
	ca.sName as sCategoryName,
	pl.sName as sPlaceName,
	pt.sName as sPaymentTypeName,
	ex.dSum
from dbo.t_Expenses ex

left join dbo.t_dicPaymentTypes pt on ex.nPaymentTypeId=pt.nId
left join dbo.t_dicUsers us on ex.nUserId=us.nId
left join dbo.t_dicPlaces pl on ex.nPlaceId=pl.nId
left join dbo.t_dicCategories  ca on ex.nCategoryId=ca.nId
