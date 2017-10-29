drop table measure_dates_parquet;
create table measure_dates_parquet as
select
measure_id,
measure_name
from measure_dates
;
