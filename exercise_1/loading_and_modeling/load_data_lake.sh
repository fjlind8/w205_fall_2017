#!/bin/bash

# Save my current directory
my_dir=$(pwd)

# Create staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

cd ~/staging/exercise_1

# Retrieve and unzip data from data.medicare.gov
my_url="https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

wget "$my_url" -O medicare_data.zip
unzip medicare_data.zip

# Remove header line of the files and rename to more readable names
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > survey_responses.csv

# Make Hadoop directories and move files to HDFS
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put measures.csv /user/w205/hospital_compare
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare

# Change back to current directory
cd $my_dir

exit
