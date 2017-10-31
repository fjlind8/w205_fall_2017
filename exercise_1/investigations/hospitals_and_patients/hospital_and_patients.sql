drop table hospitals_and_patients;
create table hospitals_and_patients as
select
round(corr(a.weighted_avg_score, b.hcahps_base_score + b.hcahps_base_score), 4) correlation_avg,
round(corr(a.var_score, b.hcahps_base_score + b.hcahps_base_score), 4) correlation_var
from
(
select
a.provider_id,
b.hospital_name,
count(measure_id) measure_count,
cast(sum(score * sample) as float) / sum(sample) weighted_avg_score,
variance(score) var_score
from effective_care_parquet a
join hospitals_parquet b on a.provider_id = b.provider_id
where b.hospital_type <> 'Childrens'
and b.hospital_type <> 'ACUTE CARE - VETERANS ADMINISTRATION'
and measure_id <> 'ED_1b'
and measure_id <> 'ED_2b'
and measure_id <> 'OP_1'
and measure_id <> 'OP_18b'
and measure_id <> 'OP_20'
and measure_id <> 'OP_21'
and measure_id <> 'OP_22'
and measure_id <> 'OP_3b'
and measure_id <> 'OP_5'
and measure_id <> 'PC_01'
and measure_id <> 'STK_4'
and measure_id <> 'VTE_6'
group by a.provider_id, b.hospital_name
having measure_count >= 25
) a
join survey_responses_parquet b on a.provider_id = b.provider_id
;
