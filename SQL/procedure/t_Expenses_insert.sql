create procedure api.usp_InsertExpense (@pdtDate datetime2, @pnUserId int, @pnCategorieId smallint, @pnPlaceId smallint, @pnPaymentTypeId tinyint, @pdSum decimal(24,4))
as begin
insert dbo.t_Expenses (dtDate, nUserId. nCategorieId,nPlaceId, nPaymentTypeId, dSum) values (@pdtDate, @pnCategorieId, @pnPlaceId, @pnPaymentTypeId, @pdSum);
end