drop table hospitals_parquet;
create table hospitals_parquet as
select
cast(provider_id as int) provider_id,
hospital_name,
address,
city,
state,
zip_code,
county_name,
phone_number,
hospital_type,
hospital_ownership,
emergency_services
from hospitals
;
