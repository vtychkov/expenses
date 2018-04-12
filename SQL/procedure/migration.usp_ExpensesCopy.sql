alter procedure migration.usp_ExpensesCopy
	as
begin 
	insert migration.t_Expenses(dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum
		from [dbo].[t_Expenses] d
	where d.nId not in (select m.nId from [migration].[t_Expenses] m)
	and d.nCategoryId in (select d.nId from [dbo].[t_dicCategories] d)
	insert migration.t_Expenses(dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select dtDate, nUserId, -1, nPlaceId, nPaymentTypeId, dSum
		from [dbo].[t_Expenses] d
	where d.nId not in (select m.nId from [migration].[t_Expenses] m)
	and (d.nCategoryId not in (select d.nId from [dbo].[t_dicCategories] d)
	or d.nCategoryId is null)
end

