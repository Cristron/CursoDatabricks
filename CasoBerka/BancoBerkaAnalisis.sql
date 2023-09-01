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


select *
from BERKA_ACCOUNT;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_CARD;

CREATE TABLE BERKA_CARD
USING csv
OPTIONS (path "/FileStore/card.asc", header "true", delimiter ";");

describe BERKA_CARD;

-- COMMAND ----------


select *
from BERKA_CARD;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_CLIENT;

CREATE TABLE BERKA_CLIENT
USING csv
OPTIONS (path "/FileStore/client.asc", header "true", delimiter ";");

describe BERKA_CLIENT;

-- COMMAND ----------


select *
from BERKA_CLIENT;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_DISP;

CREATE TABLE BERKA_DISP
USING csv
OPTIONS (path "/FileStore/disp.asc", header "true", delimiter ";");

describe BERKA_DISP;

-- COMMAND ----------


select *
from BERKA_DISP;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_DISTRICT;

CREATE TABLE BERKA_DISTRICT
USING csv
OPTIONS (path "/FileStore/district.asc", header "true", delimiter ";");

describe BERKA_DISTRICT;

-- COMMAND ----------


select *
from BERKA_DISTRICT;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_LOAN;

CREATE TABLE BERKA_LOAN
USING csv
OPTIONS (path "/FileStore/loan.asc", header "true", delimiter ";");

describe BERKA_LOAN;

-- COMMAND ----------


select *
from BERKA_LOAN;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_ORDER;

CREATE TABLE BERKA_ORDER
USING csv
OPTIONS (path "/FileStore/order.asc", header "true", delimiter ";");

describe BERKA_ORDER;

-- COMMAND ----------


select *
from BERKA_ORDER;

-- COMMAND ----------


DROP TABLE IF EXISTS BERKA_TRANS;

CREATE TABLE BERKA_TRANS
USING csv
OPTIONS (path "/FileStore/trans.asc", header "true", delimiter ";");

describe BERKA_TRANS;

-- COMMAND ----------


select *
from BERKA_TRANS;

-- COMMAND ----------

DROP TABLE IF EXISTS TABLA_MINABLE;

CREATE TABLE TABLA_MINABLE as
select berka_client.client_id as cliente, berka_disp.account_id as cuenta, berka_district.A11 as ingresos, berka_loan.status as estado_prestamo, berka_loan.amount as monto_prestamo, berka_loan.payments as pago_mensual
from berka_district
inner join berka_client on berka_district.A1 = berka_client.district_id 
inner join berka_disp on berka_client.client_id = berka_disp.client_id 
inner join berka_loan on berka_disp.account_id =berka_loan.account_id ;

-- COMMAND ----------


select *
from TABLA_MINABLE;
