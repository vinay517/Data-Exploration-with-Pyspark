-- Databricks notebook source
/*bar chart*/
select * from cogsley_sales limit 100;

-- COMMAND ----------

/*line plot*/
select * from cogsley_sales limit 100;

-- COMMAND ----------

select i.StateCode, round(sum(s.SaleAmount)) as Sales
from cogsley_sales s
join state_info_csv i on s.State = i.State
group by i.StateCode

-- COMMAND ----------

select *
from cogsley_sales
limit 100;

-- COMMAND ----------


