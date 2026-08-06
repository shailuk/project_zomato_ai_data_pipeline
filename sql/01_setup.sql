USE ROLE ACCOUNTADMIN; 

--- Compute : Extra small, auto-suspend fast so the trial credits last. 
CREATE WAREHOUSE IF NOT EXISTS ZOMATO_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60 
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE; 

-- Database + Medallion Schemas 
CREATE DATABASE IF NOT EXISTS ZOMATO;   -- Iceberg tables spark wrote (dbt sources) 
CREATE SCHEMA IF NOT EXISTS ZOMATO.RAW; -- Only used by the COPY fallback path 
CREATE SCHEMA IF NOT EXISTS ZOMATO.STAGING; -- Cleaned / Conformed (dbt)
CREATE SCHEMA IF NOT EXISTS ZOMATO.MARTS;  -- Gold, Iceberg (dbt)
CREATE SCHEMA IF NOT EXISTS ZOMATO.SNAPSHOTS; -- SCD2 history (ddt) 
CREATE SCHEMA IF NOT EXISTS ZOMATO.AI;  -- LLM-enriched tables (OpenAI Jobs

-- Roles used by dbt and airflow
CREATE ROLE IF NOT EXISTS DBT_ROLE;  -- Create a custom user group/role named DBT_ROLE if it doesn't already exist.
GRANT USAGE ON WAREHOUSE ZOMATO_WH TO ROLE DBT_ROLE;  -- USAGE: Allows DBT_ROLE to connect to and use the virtual computer/cluster (ZOMATO_WH) to run queries.
GRANT OPERATE ON WAREHOUSE ZOMATO_WH TO ROLE DBT_ROLE;  -- OPERATE: Allows DBT_ROLE to turn the warehouse ON, turn it OFF, or resize it when running data pipeline jobs.
-- Gives DBT_ROLE full freedom to read, write, and manage everything inside the ZOMATO database and all of its existing folders/schemas
GRANT ALL ON DATABASE ZOMATO TO ROLE DBT_ROLE;   
GRANT ALL ON ALL SCHEMAS IN DATABASE ZOMATO TO ROLE DBT_ROLE; 
-- Whenever anyone creates a new schema, table, or view inside the ZOMATO database in the future, automatically grant DBT_ROLE full access to it.
GRANT ALL ON FUTURE SCHEMAS IN DATABASE ZOMATO TO ROLE DBT_ROLE; 
GRANT ALL ON FUTURE TABLES IN DATABASE ZOMATO TO ROLE DBT_ROLE; 
GRANT ALL ON FUTURE VIEWS IN DATABASE ZOMATO TO ROLE DBT_ROLE; 

-- Let your login use the role (replace with your snowflake username). 
SET my_user = CURRENT_USER();
--SELECT $my_user;
GRANT ROLE DBT_ROLE TO USER IDENTIFIER ($my_user);

SELECT 'setup complete' AS status; 
