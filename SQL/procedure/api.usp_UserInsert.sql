create procedure api.usp_UserInsert(
	@psSurname nvarchar(100)
	,@psName nvarchar(100)
	,@pdtBirtday date
	,@psPhone varchar(20)
	,@psEmail varchar(100)
)
as
begin
	insert into dbo.t_dicUsers(
		sSurname
		,sName
		,dtBirthday
		,sPhone
		,sEmail
	)values(
		@psSurname
		,@psName
		,@pdtBirtday
		,@psPhone
		,@psEmail
	);
end