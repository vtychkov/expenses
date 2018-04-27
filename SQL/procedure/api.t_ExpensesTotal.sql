alter procedure api.t_ExpensesTotal(
@pdtDateStart as date,
@pdtDateFinal as date
)
as
begin
select 
	dtDate
	,sSurname
	,sName
	,dtBirthday
	,sSex
	,sPhone
	,sEmail
	,nCategoryId
	,nPlaceId
	,nPaymenttypeId
	,sum(dSum) as dSum
from [dbo].[t_Expenses] e
	 join [dbo].[t_dicUsers] u on e.nUserId=u.nId
	 where dtDate between @pdtDateStart and @pdtDateFinal
group by 
	dtDate
	,sSurname
	,sName
	,dtBirthday
	,sSex
	,sPhone
	,sEmail
	,nCategoryId
	,nPlaceId
	,nPaymenttypeId
	end