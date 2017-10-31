drop table survey_responses_parquet;
create table survey_responses_parquet as
select
provider_id,
cast(trim(substring(hcahps_base_score, 0, 2)) as int) hcahps_base_score,
cast(trim(substring(hcahps_consistency_score, 0, 2)) as int) hcahps_consistency_score
from survey_responses
where hcahps_base_score <> 'Not Available'
;
