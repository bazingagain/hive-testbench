create database if not exists ${DB};
use ${DB};

drop table if exists customer_address;

create table customer_address
stored as ${FILE}
location '${LOCATION}/customer_address'
as select * from ${SOURCE}.customer_address 
CLUSTER BY ca_address_sk
;
