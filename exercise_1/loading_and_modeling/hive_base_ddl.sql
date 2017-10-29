drop table hospitals;
create external table hospitals
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
hospital_type string,
hospital_ownership string,
emergency_services string
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties
(
"separatorChar" = ",",
"quoteChar"     = "\"",
"escapeChar" = '\\'
)
location '/user/w205/hospital_compare/hospitals'
;

drop table effective_care;
create external table effective_care
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
condition string,
measure_id string,
measure_name string,
score string,
sample string,
footnote string,
measure_start_date string,
measure_end_date string
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties
(
"separatorChar" = ",",
"quoteChar"     = "\"",
"escapeChar" = '\\'
)
location '/user/w205/hospital_compare/effective_care'
;

drop table readmissions;
create external table readmissions
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
measure_name string,
measure_id string,
compared_to_national string,
denominator string,
score string,
lower_estimate string,
higher_estimate string,
footnote string,
measure_start_date string,
measure_end_date string
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties
(
"separatorChar" = ",",
"quoteChar"     = "\"",
"escapeChar" = '\\'
)
location '/user/w205/hospital_compare/readmissions'
;

drop table measures;
create external table measures
(
measure_name string,
measure_id string,
measure_start_quarter string,
measure_start_date string,
measure_end_date string
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties
(
"separatorChar" = ",",
"quoteChar"     = "\"",
"escapeChar" = '\\'
)
location '/user/w205/hospital_compare/measures'
;

drop table survey_responses;
create table survey_responses
(
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
comm_nurse_achievement string,
comm_nurse_improvement string,
comm_nurse_score string,
comm_doctor_achievement string,
comm_doctor_improvement string,
comm_doctor_score string,
responsiveness_achievement string,
responsiveness_improvement string,
responsiveness_score string,
pain_mgmt_achievement string,
pain_mgmt_improvement string,
pain_mgmt_score string,
comm_meds_achievement string,
comm_meds_improvement string,
comm_meds_score string,
clean_quiet_achievement string,
clean_quiet_improvement string,
clean_quiet_score string,
discharge_achievement string,
discharge_improvement string,
discharge_score string,
overall_rating_achievement string,
overall_rating_improvement string,
overall_rating_score string,
hcahps_base_score string,
hcahps_consistency_score string
)
row format serde 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties
(
"separatorChar" = ",",
"quoteChar"     = "\"",
"escapeChar" = '\\'
)
location '/user/w205/hospital_compare/survey_responses'
;
