Transforming

Note: I tested that all 5 of these queries work when I run the query directly in the CLI. I was not able to figure out how to run a .sql file from spark similar to "hive -f /path/to/file".

I began my analysis by looking at the different hospital types from the table hospitals. I noticed that Children's and VA hospitals occur much less frequently than Acute Care or Critical Care. When asked which hospitals provide the best care for patients, I could have grouped by hospital type, but a majority of citizens in the country are adult, non-Veterans, so my answers are tailored to the majority of the population.

I also noticed lots of records in the Effective Care, Readmissions and Deaths, and Survey Reponses data sets where the score value was 'Not Available'. I decided to remove these records from my transformed tables rather than change the nulls to the mean, or some other transformation. I did not find it logical to change these nulls to the mean value because I was lacking both the score and sample metrics. I did consider partitioning the data by state and updating the nulls to the average value by hospitals in that state, but ultimately decided against it. I envision there are many factors that could support my decision to not treat nulls like averages. Some examples include which state the hospital resides in, urban vs rural geographic location (or population), socio-economic status, health and education status of citizens, etc.

I ran this query and found there were several discrepancies in how the same measure_id was written across tables:

select distinct
a.measure_id
from effective_care a
left join measures b on a.measure_id = b.measure_id
where b.measure_id is null
;

SCIP_INF_1                                                                      
SCIP_INF_2
SCIP_INF_3
SCIP_INF_4
SCIP_INF_9
IMM_3_FAC_ADHPCT
SCIP_CARD_2
SCIP_INF_10

All the cases that begin with SCIP were because the measures table had lowercase "inf" and "card". This led me to transform all measure_ids to upper(measure_id), and change 'IMM_3_FAC_ADHPCT' to 'IMM_3' using an if statement to match the measures table.

I ran a similar query on provider_id instead of measure_id but did not find any reason for concern in any of the tables hospitals, effective_care, or readmissions.

The measure 'EDV' was not scored on a scale of 0 - 100 but instead a categorical scale of 5 levels. I decided to omit this variable from my data set so I could transform score to an integer data, making it easier to perform aggregations later on. Similarly, the providers with '11 - There were discrepancies in the data collection process.' as a footnote were omitted because I was not comfortable using questionable data.
