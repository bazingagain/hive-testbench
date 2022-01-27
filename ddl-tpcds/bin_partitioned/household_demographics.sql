create database if not exists ${DB};
use ${DB};

drop table if exists household_demographics;

create table household_demographics
stored as ${FILE}
location '${LOCATION}/household_demographics'
as select * from ${SOURCE}.household_demographics;
