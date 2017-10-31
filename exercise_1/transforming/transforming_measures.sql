drop table measures_parquet;
create table measures_parquet as
select
upper(measure_id) measure_id,
measure_name
from measures
;
