create database if not exists ${DB};
use ${DB};

drop table if exists ship_mode;

create table ship_mode
stored as ${FILE}
location '${LOCATION}/ship_mode'
as select * from ${SOURCE}.ship_mode;
