create view olap.v_dimUsers 
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
	migration.t_dicUsers