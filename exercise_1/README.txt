Exercise 1

This GitHub folder contains Eric Lind's submission for Exercise 1. I am in the W205 class on Monday 4:00 PM Berkeley time. Each of the folders loading_and_modeling, transforming, and investigations all contain a separate README.txt file that I encourage you to read as you explore the rest of my project files.

This exercise demonstrates how to perform data extraction, transformation, and analysis with a variety of tools on the AWS platform. The data we are interested in is found at data.medicare.gov. A newer version of the data may be available if you download the files directly from the website, but we are using a specific historical version so all students in the class are working from the same data set. The goal of the exercise is to answer the following 4 questions:

1) What hospitals are models of high-quality care? That is, which hospitals have the most consistently high scores for a variety of procedures?
2) What states are models of high-quality care?
3) Which procedures have the greatest variability between hospitals?
4) Are average scores for hospital quality or procedural variability correlated with patient survey responses?

The loading_and_modeling folder contains a shell script and sql file. The shell script will download the files from data.medicare.gov to the local AWS directory, edit the files, and upload to the HDFS. The sql file will create hive tables from the raw .csv files. There are only 5 raw files that we are interested in

The transforming folder contains several files that will transform the base hive tables into more easy-to-use files for future analysis.

The investigations folder contains a subfolder for each of the questions. There is a .sql file to provide the results of my analysis and a .txt file to explain my methodology.
