create database if not exists ${DB};
use ${DB};

drop table if exists catalog_page;

create table catalog_page
stored as ${FILE}
location '${LOCATION}/catalog_page'
as select * from ${SOURCE}.catalog_page;
