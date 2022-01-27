create database if not exists ${DB};
use ${DB};

drop table if exists customer_demographics;

create table customer_demographics
stored as ${FILE}
location '${LOCATION}/customer_demographics'
as select * from ${SOURCE}.customer_demographics;
