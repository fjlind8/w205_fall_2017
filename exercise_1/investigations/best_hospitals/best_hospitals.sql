drop table best_states;
create table best_states as
select
variety.state,
0.4 * variety.weighted_avg_score + 0.6 * variety.weighted_avg_score as final_score,
variety.weighted_avg_score variety_weighted_avg_score,
severe.var_score variety_var_score,
severe.weighted_avg_score severe_weighted_avg_score,
severe.var_score severe_var_score
from
(
select
b.state,
count(measure_id) as measure_count,
sum(sample) as population_count,
round(cast(sum(score * sample) as float) / sum(sample), 4) weighted_avg_score,
round(variance(score), 4) var_score
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
count(measure_id) as measure_count,
sum(denominator) as population_count,
round(cast(sum(denominator * score) as float) / sum(denominator), 4) as weighted_avg_score,
round(variance(score), 4) as var_score
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
