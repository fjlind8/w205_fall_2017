Exercise 2

This GitHub folder contains Eric Lind's submission for Exercise 2. I am in the W205 class on Monday 4:00 PM Berkeley time. The main stream parse files are located in the extweetwordcount directory, and sample screenshots of my end-to-end solution working can be found in the screenshots directory.

This project is designed to work from the UCB AMI. Hadoop and postgres have already been installed on the AMI, along with python, but there are a few packages to install as root:
- tweepy
- psycopg2
- pandas
- matplotlib (when importing, use the following code:
>>> import matplotlib
>>> matplotlib.use('Agg')
>>> import matplotlib.pyplot as plt
)

The scripts Plot.py, finalresults.py, histogram.py, and the stream parse (located in extweetwordcount) all require a postgres database tcount to be created with the table tweetwordcount. The syntax to create them is in exercise_2/psycopg-sample.py, or you can just run that file as is. Once tcount and tweetwordcount are created, you should be able to execute the python scripts listed above, as well as "sparse run" from the /extweetwordcount directory to load new data into the tcount database.

The files of production relevance in the current exercise_2 directory are:
- Architecture.pdf - visual representation of the architecture of this application
- Plot.py - generates Plot.png, which is a bar chart of the top 20 words in the twitter stream
- finalresults.py - displays the word count for the single word entered ($ python finalresults.py <word>), or if no word is entered, then all words
- histogram.py - displays the word count for all words with counts between the two integers entered ($ python histogram.py <k1> <k2>)
- psycopg-sample.py - creates the tcount database and table tweetwordcount

The remaining files were only used for testing purposes:
- Twittercredentials.py - feeds hello-stream-twitter.py
- hello-stream-twitter.py - tests the tweepy package using application credentials created on Twitter
- psycopg-word-count.py - test system arguments for running python script
