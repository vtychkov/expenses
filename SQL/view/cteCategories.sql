with cteCategories as 
(
select 
	nId, 
	sName, 
	1 as nCategoryLevel,
	nParentId
from 
	dbo.t_dicCategories dc
where 
	nParentId is null
union all
select 
	ca.nId, 
	ca.sName, 
	cte.nCategoryLevel+1 as nCategoryLevel,
	ca.nParentId
from 
	dbo.t_dicCategories ca
	join cteCategories cte on cte.nId=ca.nParentId
	)
select 
	c.nId,
	c.sName,
	nCategoryLevel,
	dc.sName as nParentid
from cteCategories c
left join dbo.t_dicCategories dc on c.nParentId = dc.nId
order by  nCategoryLevel,nId
/*with cteCategories as 
(
select 
	nId
	,sName
	,1 as nCategoryLevel
	,nParentId
from 
	dbo.t_dicCategories dc
where
	nParentId is null
union all
select 
	ca.nId
	,ca.sName
	,cte.nCategoryLevel + 1 as nCategoryLevel
	,ca.nParentId
from 
	dbo.t_dicCategories ca
	join cteCategories cte on cte.nId=ca.nParentId
)
select
	c.nId
	,c.sName
	,nCategoryLevel
	,dc.sName as sParentName
from
	cteCategories c
	left join dbo.t_dicCategories dc on c.nParentId = dc.nId
order by
	nCategoryLevel
	,nId*/