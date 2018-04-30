create view olap.v_dim_periods
as
select 
	cast(ex.dtDate as date) as dtDate
	,cast(format (ex.dtDate, 'yyyyMMdd' )as int) as nDateId
	

from migration.t_Expenses ex
group by cast(ex.dtDate as date)
,cast(format (ex.dtDate, 'yyyyMMdd' )as int)

