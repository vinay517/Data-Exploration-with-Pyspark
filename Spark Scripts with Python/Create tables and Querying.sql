-- Databricks notebook source
-- MAGIC %fs ls /databricks-datasets/samples/population-vs-price/

-- COMMAND ----------

/* creating table without schema */
CREATE TABLE IF NOT EXISTS population_price
USING CSV
OPTIONS(path = 'dbfs:/databricks-datasets/samples/population-vs-price/data_geo.csv', header = 'true', inferschema = 'true'
)



-- COMMAND ----------

select * from population_price limit 100;

-- COMMAND ----------

/* creating table with schema */ 
create table if not exists online_retail(
InvoiceNo string,
StockCode string,
Description string,
Quantity int,
InvoiceDate string,
UnitPrice double,
CustomerID int,
Country string)
USING CSV
OPTIONS (path "/databricks-datasets/online_retail/data-001/data.csv", header "true");


-- COMMAND ----------

select * from online_retail limit 100

-- COMMAND ----------

/* Another table named cogsley sales is created using UI */ 

-- COMMAND ----------

select * from cogsley_sales_csv limit 100;

-- COMMAND ----------

/*calculating sales totals*/
select companyname, round(sum(saleamount)) as sales
from cogsley_sales_csv
group by companyname
order by 2 desc

-- COMMAND ----------

/* joining tables */
select CompanyName, IPOYear, Symbol, round(sum(SaleAmount)) as Sales
from cogsley_sales_csv cs
left join cogsley_clients_csv cc on cs.companyname = cc.name
group by CompanyName, IPOYear, Symbol
order by 1

-- COMMAND ----------

select i.StateCode, round(sum(s.SaleAmount)) as Sales
from cogsley_sales_csv s
join state_info_csv i on s.State = i.State
group by i.StateCode

-- COMMAND ----------


