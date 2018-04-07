alter procedure api.usp_UserUpdate(
	@pnId int
	,@psSurname nvarchar(100)
	,@psName nvarchar(100)
	,@pdtBirthday date
	,@psSex char(1)
	,@psPhone varchar(20)
	,@psEmail varchar(100)
)
as
begin
	update dbo.t_dicUsers
	set 
		sSurname = @psSurname
		,sName = @psName
		,dtBirthday = @pdtBirthday
		,sSex = @psSex
		,sPhone = @psPhone
		,sEmail = @psEmail
	where
		nId = @pnId;
end