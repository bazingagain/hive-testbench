create database if not exists ${DB};
use ${DB};

drop table if exists reason;

create table reason
stored as ${FILE}
location '${LOCATION}/reason'
as select * from ${SOURCE}.reason;
