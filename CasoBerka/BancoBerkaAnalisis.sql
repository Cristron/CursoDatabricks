-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Analisis de TABLA MINABLE del Banco Berka

-- COMMAND ----------

-- DBTITLE 1,Análisis Banco Berka

DROP TABLE IF EXISTS BERKA_ACCOUNT;

CREATE TABLE BERKA_ACCOUNT
USING csv
OPTIONS (path "/FileStore/account.asc", header "true", delimiter ";");

describe BERKA_ACCOUNT

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_ACCOUNT;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_CARD;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_CARD
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/card.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_CARD;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_CARD;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_CLIENT;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_CLIENT
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/client.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_CLIENT;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_CLIENT;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_DISP;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_DISP
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/disp.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_DISP;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_DISP;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_DISTRICT;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_DISTRICT
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/district.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_DISTRICT;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_DISTRICT;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_LOAN;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_LOAN
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/loan.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_LOAN;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_LOAN;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_ORDER;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_ORDER
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/order.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_ORDER;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_ORDER;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DROP TABLE IF EXISTS BERKA_TRANS;
-- MAGIC
-- MAGIC CREATE TABLE BERKA_TRANS
-- MAGIC USING csv
-- MAGIC OPTIONS (path "/FileStore/trans.asc", header "true", delimiter ";");
-- MAGIC
-- MAGIC describe BERKA_TRANS;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from BERKA_TRANS;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC CREATE TABLE TABLA_MINABLE as
-- MAGIC select berka_client.client_id as cliente, berka_disp.account_id as cuenta, berka_district.A11 as ingresos, berka_loan.status as estado_prestamo, berka_loan.amount as monto_prestamo, berka_loan.payments as pago_mensual
-- MAGIC from berka_district
-- MAGIC inner join berka_client on berka_district.A1 = berka_client.district_id 
-- MAGIC inner join berka_disp on berka_client.client_id = berka_disp.client_id 
-- MAGIC inner join berka_loan on berka_disp.account_id =berka_loan.account_id ;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select *
-- MAGIC from TABLA_MINABLE;
