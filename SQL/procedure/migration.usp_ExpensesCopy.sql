alter procedure migration.usp_ExpensesCopy
	as
begin 
	insert migration.t_Expenses(dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum
		from [dbo].[t_Expenses] d
	where d.nId not in (select m.nId from [migration].[t_Expenses] m)
	and d.nCategoryId is not null
	insert migration.t_Expenses(dtDate, nUserId, nCategoryId, nPlaceId, nPaymentTypeId, dSum) 
	select dtDate, nUserId, 0, nPlaceId, nPaymentTypeId, dSum
		from [dbo].[t_Expenses] d
	where d.nId not in (select m.nId from [migration].[t_Expenses] m)
	and d.nCategoryId is null
end

