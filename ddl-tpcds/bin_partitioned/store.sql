create database if not exists ${DB};
use ${DB};

drop table if exists store;

create table store
stored as ${FILE}
location '${LOCATION}/store'
as select * from ${SOURCE}.store
CLUSTER BY s_store_sk
;
