create procedure migration.usp_UsersLoad
	as
begin 
	insert migration.t_dicUsers(sSurname,sName, dtBirthday, sSex, sPhone, sEmail) 
	select d.sSurname,d.sName,d.dtBirthday, d.sSex, d.sPhone, d.sEmail
		from dbo.t_dicUsers d left join migration.t_dicUsers m on d.nId=m.nId
		where m.nId is null
end

