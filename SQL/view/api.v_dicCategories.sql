﻿alter view api.v_dicCategories
as
select
	nId
	,sName
	,nParentId
from
	dbo.t_dicCategories