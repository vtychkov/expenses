create view api.v_dicUsers
as
select concat (Us.sSurname,' ',Us.sName)'sName'
from dbo.t_dicUsers Us;