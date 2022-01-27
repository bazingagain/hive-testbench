create database if not exists ${DB};
use ${DB};

drop table if exists promotion;

create table promotion
stored as ${FILE}
location '${LOCATION}/promotion'
as select * from ${SOURCE}.promotion;
