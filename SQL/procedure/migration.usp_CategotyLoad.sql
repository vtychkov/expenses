alter procedure migration.usp_CategoryLoad
	as
begin 
	insert migration.t_dicCategories(
	nCategoryLevel1Id 
	,sCategoryLevel1Name 
	,nCategoryLevel2Id 
	,sCategoryLevel2Name 
	,nCategoryLevel3Id 
	,sCategoryLevel3Name 
	)
	select d.sName, d.nParentId,7,7,7,7
		from [dbo].[t_dicCategories] d left join migration.t_dicCategories m on d.nId=m.nLevel3Id
		where m.nLevel3Id is null
	
	
end

