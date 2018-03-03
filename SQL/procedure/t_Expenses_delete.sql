create procedure api.usp_DeleteExpense (@pnId int)
as begin
delete from dbo.t_Expenses where nId=@pnId
end