create procedure migration.usp_UsersCopy
	as
begin 
	insert migration.t_dicUsers(sSurname,sName, dtBirthday, sSex, sPhone, sEmail) 
	select sSurname,sName, dtBirthday, sSex, sPhone, sEmail
		from [dbo].[t_dicUsers] d
	where d.nId not in (select m.nId from [migration].[t_dicUsers] m)
	
end

