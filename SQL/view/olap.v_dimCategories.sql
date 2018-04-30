create view olap.v_dimCategories
as
select
	nCategoryLevel1Id
	,sCategoryLevel1Name 
	,nCategoryLevel2Id
	,sCategoryLevel2Name
	,nCategoryLevel3Id as nId
	,sCategoryLevel3Name	as sName
from
	migration.t_dicCategories