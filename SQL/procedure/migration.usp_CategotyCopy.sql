create procedure migration.usp_CategoryLoad
	as
begin 
	insert migration.t_dicCategories(sName, nParentid) 
	select d.sName, d.nParentId
		from [dbo].[t_dicCategories] d left join migration.t_dicCategories m on d.nId=m.nId
		where m.nId is null
	
	
end

