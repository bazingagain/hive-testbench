create database if not exists ${DB};
use ${DB};

drop table if exists call_center;

create table call_center
stored as ${FILE}
location '${LOCATION}/call_center'
as select * from ${SOURCE}.call_center;
