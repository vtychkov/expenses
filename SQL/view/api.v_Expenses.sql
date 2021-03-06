alter view api.v_Expenses
as
select
	e.nId
	,e.dtDate
	,e.nUserId
	,u.sEmail as sLogin
	,e.nCategoryId
	,c.sName as sCategoryName
	,e.nPlaceId
	,p.sName as sPlaceName
	,e.nPaymentTypeId
	,pt.sName as sPaymentTypeName
	,e.dSum
from
	Expenses.dbo.t_Expenses e
	join dbo.t_dicUsers u on e.nUserId = u.nId
	join dbo.t_dicCategories c on e.nCategoryId = c.nId
	join dbo.t_dicPlaces p on e.nPlaceId = p.nId
	join dbo.t_dicPaymentTypes pt on e.nPaymentTypeId = pt.nId