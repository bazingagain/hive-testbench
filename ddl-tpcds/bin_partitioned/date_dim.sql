create database if not exists ${DB};
use ${DB};

drop table if exists date_dim;

create table date_dim
stored as ${FILE}
location '${LOCATION}/date_dim'
as select * from ${SOURCE}.date_dim;
