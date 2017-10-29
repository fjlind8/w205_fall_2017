drop table readmissions_parquet;
create table readmissions_parquet as
select
cast(provider_id as int) provider_id,
measure_id,
compared_to_national,
cast(denominator as int) denominator,
cast(score as decimal(1, 0)) score
from readmissions
where score <> 'Not Available'
;
