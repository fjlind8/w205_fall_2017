drop table effective_care_parquet;
create table effective_care_parquet as
select
provider_id,
condition,
measure_id,
cast(score as int) score,
cast(sample as int) sample
from effective_care
where measure_id <> 'EDV'
and score <> 'Not Available'
and footnote <> '11 - There were discrepancies in the data collection process.'
;
