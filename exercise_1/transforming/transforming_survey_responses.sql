drop table survey_responses_parquet;
create table survey_responses_parquet as
select
cast(provider_id as int) provider_id
from survey_responses
;
