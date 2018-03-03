create procedure api.usp_DeletePlace (@pnId smallint)
as begin
delete from dbo.t_Places where nId=@pnId
end