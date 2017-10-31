drop table best_hospitals;
create table best_hospitals as
select
variety.provider_id,
variety.hospital_name,
round(variety.weighted_avg_score - severe.weighted_avg_score, 4) final_score,
round(variety.weighted_avg_score, 4) variety_weighted_avg_score,
round(variety.var_score, 4) variety_var_score,
round(severe.weighted_avg_score, 4) severe_weighted_avg_score,
round(severe.var_score, 4) severe_var_score
from
(
select
a.provider_id,
b.hospital_name,
count(measure_id) measure_count,
sum(sample) population_count,
cast(sum(score * sample) as float) / sum(sample) weighted_avg_score,
variance(score) var_score
from effective_care_parquet a
join hospitals_parquet b on a.provider_id = b.provider_id
where b.hospital_type <> 'Childrens'
and b.hospital_type <> 'ACUTE CARE - VETERANS ADMINISTRATION'
and measure_id <> 'ED_1B'
and measure_id <> 'ED_2B'
and measure_id <> 'OP_1'
and measure_id <> 'OP_18B'
and measure_id <> 'OP_20'
and measure_id <> 'OP_21'
and measure_id <> 'OP_22'
and measure_id <> 'OP_3B'
and measure_id <> 'OP_5'
and measure_id <> 'PC_01'
and measure_id <> 'STK_4'
and measure_id <> 'VTE_6'
group by a.provider_id, b.hospital_name
having measure_count >= 25
) variety

join
(
select
a.provider_id,
b.hospital_name,
count(measure_id) measure_count,
sum(denominator) population_count,
cast(sum(denominator * score) as float) / sum(denominator) weighted_avg_score,
variance(score) var_score
from readmissions_parquet a
join hospitals_parquet b on a.provider_id = b.provider_id
where b.hospital_type <> 'Childrens'
and b.hospital_type <> 'ACUTE CARE - VETERANS ADMINISTRATION'
group by a.provider_id, b.hospital_name
having measure_count >= 7
) severe on variety.provider_id = severe.provider_id
order by final_score desc
limit 10
;
