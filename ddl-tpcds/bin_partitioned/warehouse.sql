create database if not exists ${DB};
use ${DB};

drop table if exists warehouse;

create table warehouse
stored as ${FILE}
location '${LOCATION}/warehouse'
as select * from ${SOURCE}.warehouse;
