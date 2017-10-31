drop table hospitals_parquet;
create table hospitals_parquet as
select
provider_id,
hospital_name,
address,
city,
state,
hospital_type,
hospital_ownership,
emergency_services
from hospitals
;
