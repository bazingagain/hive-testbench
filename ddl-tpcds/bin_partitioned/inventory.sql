create database if not exists ${DB};
use ${DB};

drop table if exists inventory;

create table inventory
stored as ${FILE}
location '${LOCATION}/inventory'
as select * from ${SOURCE}.inventory
CLUSTER BY inv_date_sk
;
