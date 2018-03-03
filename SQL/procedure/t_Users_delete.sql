create procedure api.usp_DeleteUser (@pnId int)
as begin
delete from dbo.t_Users where nId=@pnId
end