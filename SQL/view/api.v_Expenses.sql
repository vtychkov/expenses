create view api.v_Expenses
as
select Ex.dtDate, concat (Us.sSurname,' ',Us.sName)'sUserName',Ca.sName'sCategoryName', Pl.sName'sPlaceName', PT.sName'sPaymentTypeName',Ex.dSum
from dbo.t_Expenses Ex

left join dbo.t_dicPaymentTypes PT on Ex.nPaymentTypeId=PT.nId
left join dbo.t_dicUsers Us on Ex.nUserId=Us.nId
left join dbo.t_dicPlaces Pl on Ex.nPlaceId=Pl.nId
left join dbo.t_dicCategories  Ca on Ex.nCategoryId=Ca.nId