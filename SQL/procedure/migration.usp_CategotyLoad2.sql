select
	c1.nId as nCategoryLevel1Id
	,c1.sName as sCategoryLevel1Name
	,coalesce(c2.nId, c1.nid) as nCategoryLevel2Id
	,coalesce(c2.sName, c1.sName) as nCategoryLevel2Name
	,coalesce(c3.nId, coalesce(c2.nId, c1.nId)) as nCategoryLevel3Id
	,coalesce(c3.sName, coalesce(c2.sName, c1.sName)) as nCategoryLevel3Name
from
	[dbo].[t_dicCategories] c1
	left join [dbo].[t_dicCategories] c2 on c1.nId=c2.nParentId or c1.nId=c2.nId
	left join [dbo].[t_dicCategories] c3 on c2.nId=c3.nParentId or c2.nId=c3.nId
	where coalesce(c3.nId, coalesce(c2.nId, c1.nId))<>coalesce(c2.nId, c1.nid)
	or coalesce(c3.nId, coalesce(c2.nId, c1.nId))=c1.nId
	order by 1,3,5