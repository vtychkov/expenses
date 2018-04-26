select case when nParentId is null then nId when nParentid>0 then nParentId end as nCategoryLevel1Id 
,case when nParentId is null then sName 
when d.nParentId >0 then (select  s from (select c1.nParentId,
c2.sName as s
from [dbo].[t_dicCategories] c1 join [dbo].[t_dicCategories] c2 on c1.nParentId=c2.nId
group by c2.sName,c1.nParentId
) as b where d.nParentId=b.nParentId )
end as sCategoryLevel1Name 

,nId as nCategoryLevel2Id
,case when nParentId is null then sName when nParentId >0 
then (select  s from (select c1.nParentId,
c2.sName as s
from [dbo].[t_dicCategories] c1 join [dbo].[t_dicCategories] c2 on c1.nParentId=c2.nId
group by c2.sName,c1.nParentId
) as b where d.nParentId=b.nParentId and d.nParentId is not null)  end as sCategoryLevel2Name  

,nId as nCategoryLevel3Id 
,--case when nParentId is null then sName when nParentId >0 then 
sName --end 
as sCategoryLevel3Name 
from [dbo].[t_dicCategories] d


/*select nId, sName, nParentId
from [dbo].[t_dicCategories]


select --c1.nParentId,
c2.sName
--,c1.sName
from [dbo].[t_dicCategories] c1 join [dbo].[t_dicCategories] c2 on c1.nParentId=c2.nId
--where c1.nParentId=1
group by c2.sName--,c1.nParentId*/