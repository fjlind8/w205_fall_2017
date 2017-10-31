drop table readmissions_parquet;
create table readmissions_parquet as
select
provider_id,
measure_id,
compared_to_national,
cast(denominator as int) denominator,
cast(score as float) score
from readmissions
where score <> 'Not Available'
;
