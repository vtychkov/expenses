create view api.v_dicUsers
as
select dbo.t_dicUsers.sSurname, dbo.t_dicUsers.sName
from dbo.t_dicUsers;