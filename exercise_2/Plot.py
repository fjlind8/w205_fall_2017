import psycopg2
import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

# Connect to the database
conn = psycopg2.connect(database = 'tcount', user = 'postgres', password = 'pass', host = 'localhost', port = '5432')
cur  = conn.cursor()

# Select the top 20 most occurring words, ordering by count descending
cur.execute('select * from tweetwordcount order by count desc limit 20')

# Load the counts into a dataframe and change the index to the word
counts    = cur.fetchall()
df_counts = pd.DataFrame(counts, columns = ['word', 'count'])
df_counts.set_index(['word'], inplace = True)

# Generate the bar plot as Plot.png
plt.clf()
df_counts.plot(kind = 'bar', title = 'The Top 20 Words in My Twitter Stream', legend = False)
plt.xticks(rotation = 90)
plt.ylabel('Count')
plt.savefig('Plot.png')
