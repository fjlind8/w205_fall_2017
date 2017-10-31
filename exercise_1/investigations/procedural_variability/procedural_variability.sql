drop table procedural_variability;
create table procedural_variability as
select
measure_id,
count(a.provider_id) provider_count,
min(score) min_score,
max(score) max_score,
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
group by measure_id
having provider_count >= 1000
order by var_score desc
limit 10
;
