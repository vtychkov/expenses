/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [nId]
      ,[dtDate]
      ,[nUserId]
      ,[nCategoryId]
      ,[nPlaceId]
      ,[nPaymentTypeId]
      ,[dSum]
      where nUserId.t_dicUsers in select 
  FROM [expenses].[dbo].[t_Expenses]
  where nPaymentTypeId=1 or nPaymentTypeId=2





  select sSurName
  from [dbo].[t_dicUsers]
  




  select nId
  from [dbo].[t_Expenses]
  where nPaymentTypeId=2
   and
     select nId
  from [dbo].[t_Expenses]
  where  not nPaymentTypeId=1


  select
	sSurName
from 
	[dbo].[t_dicUsers]
where
	nId in (select nUserId from [dbo].[t_Expenses] where nPaymentTypeId = 1)
	and 
	nId not in (select nUserId from [dbo].[t_Expenses] where nPaymentTypeId = 2)
	
	
	
	--test