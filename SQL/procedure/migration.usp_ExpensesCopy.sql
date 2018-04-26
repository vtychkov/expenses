alter procedure migration.usp_ExpensesLoad
	as
begin 
	insert migration.t_Expenses(nId,dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select d.nId, d.dtDate, d.nUserId, d.nCategoryId, d.nPlaceId, d.nPaymentTypeId, d.dSum
		from dbo.t_Expenses d left join migration.t_Expenses m on d.nId=m.nId
		where m.nId is null
	and d.nCategoryId in (select d.nId from [dbo].[t_dicCategories] d)
	insert migration.t_Expenses(nId,dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select d.nId,d.dtDate, d.nUserId, -1, d.nPlaceId, d.nPaymentTypeId, d.dSum
		from dbo.t_Expenses d left join migration.t_Expenses m on d.nId=m.nId
		where m.nId is null
	and (d.nCategoryId not in (select d.nId from [dbo].[t_dicCategories] d)
	or d.nCategoryId is null)
end

