create procedure migration.usp_CategoryCopy
	as
begin 
	insert migration.t_dicCategories(sName, nParentid) 
	select d.sName, d.nParentId
		from [dbo].[t_dicCategories] d
	where d.nId not in (select m.nId from [migration].[t_dicCategories] m)
	
end

