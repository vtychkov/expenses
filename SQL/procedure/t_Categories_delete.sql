create procedure api.usp_DeleteCategorie(@pnId smallint)
as begin
delete from dbo.t_Categories where nId=@pnId
end