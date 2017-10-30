drop table survey_responses_parquet;
create table survey_responses_parquet as
select
provider_id,
cast(trim(substring(comm_nurse_score, 0, 2)) as int) comm_nurse_score,
cast(trim(substring(comm_doctor_score, 0, 2)) as int) comm_doctor_score,
cast(trim(substring(responsiveness_score, 0, 2)) as int) responsiveness_score,
cast(trim(substring(pain_mgmt_score, 0, 2)) as int) pain_mgmt_score,
cast(trim(substring(comm_meds_score, 0, 2)) as int) comm_meds_score,
cast(trim(substring(clean_quiet_score, 0, 2)) as int) clean_quiet_score,
cast(trim(substring(discharge_score, 0, 2)) as int) discharge_score,
cast(trim(substring(overall_rating_score, 0, 2)) as int) overall_rating_score,
cast(trim(substring(hcahps_base_score, 0, 2)) as int) hcahps_base_score,
cast(trim(substring(hcahps_consistency_score, 0, 2)) as int) hcahps_consistency_score
from survey_responses
where comm_nurse_score <> 'Not Available'
;
