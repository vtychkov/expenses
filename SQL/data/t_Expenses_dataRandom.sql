insert into dbo.t_Expenses(
	--nId
	dtDate
	,dSum
	,nUserId
	,nCategoryId
	,nPlaceId
	,nPaymentTypeId
)
values
 ( DATEADD(day, ROUND(DATEDIFF(day, '2015-01-01', '2018-12-31') * RAND(CHECKSUM(NEWID())), 0),
    DATEADD(second, CHECKSUM(NEWID()) % 48000, '2015-01-01'))
		   ,ROUND((1000000*RAND()+1),0)
		   ,ROUND((12*RAND()+1),0)
		   ,ROUND((14*RAND()+1),0)
		   ,ROUND((3*RAND()+1),0)
		   ,ROUND((1*RAND()+1),0));
GO 1000000