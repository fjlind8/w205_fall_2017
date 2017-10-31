drop table best_states;
create table best_states as
select
variety.state,
round(variety.weighted_avg_score - severe.weighted_avg_score, 4) final_score,
round(variety.weighted_avg_score, 4) variety_weighted_avg_score,
round(variety.var_score, 4) variety_var_score,
round(severe.weighted_avg_score, 4) severe_weighted_avg_score,
round(severe.var_score, 4) severe_var_score
from
(
select
b.state,
count(measure_id) measure_count,
sum(sample) population_count,
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
group by b.state
having measure_count >= 30
) variety

join
(
select
b.state,
count(measure_id) measure_count,
sum(denominator) population_count,
cast(sum(denominator * score) as float) / sum(denominator) weighted_avg_score,
variance(score) var_score
from readmissions_parquet a
join hospitals_parquet b on a.provider_id = b.provider_id
where b.hospital_type <> 'Childrens'
and b.hospital_type <> 'ACUTE CARE - VETERANS ADMINISTRATION'
group by b.state
having measure_count >= 10
) severe on variety.state = severe.state
order by final_score desc
limit 10
;
