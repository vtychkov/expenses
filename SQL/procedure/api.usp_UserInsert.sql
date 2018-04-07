alter procedure api.usp_UserInsert(
	@psSurname nvarchar(100)
	,@psName nvarchar(100)
	,@pdtBirthday date
	,@psSex char(1)
	,@psPhone varchar(20)
	,@psEmail varchar(100)
)
as
begin
	insert into dbo.t_dicUsers(
		sSurname
		,sName
		,dtBirthday
		,sSex
		,sPhone
		,sEmail
	)values(
		@psSurname
		,@psName
		,@pdtBirthday
		,@psSex
		,@psPhone
		,@psEmail
	);

	--select cast(scope_identity() as int);
end