alter view api.v_dicUsers 
as
select
	nId
	,sSurname
	,sName
	,dtBirthday
	,sSex
	,sPhone
	,sEmail

from
	dbo.t_dicUsers