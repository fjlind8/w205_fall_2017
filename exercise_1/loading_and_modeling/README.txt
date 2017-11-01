Loading and modeling

load_data_lake downloads the files to a local AWS folder, renames them, removes the header file, and moves them to HDFS. Run this script from the w205 user in the home directory. I determined that only 5 raw files were needed to answer the questions outlined in the exercise.

hive_base_ddl.sql loads the raw csv files to hive tables.

er_diagram.png is an ER Diagram of the 5 tables that will be used throughout the rest of the exercise.
