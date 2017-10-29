drop table hospitals_parquet;
create table hospitals_parquet as
select
cast(provider_id as int),
hospital_name,
state
from hospitals
;
