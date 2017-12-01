import psycopg2
import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

conn = psycopg2.connect(database = 'tcount', user = 'postgres', password = 'pass', host = 'localhost', port = '5432')
cur  = conn.cursor()

cur.execute('select * from tweetwordcount order by count desc limit 20')

counts    = cur.fetchall()
df_counts = pd.DataFrame(counts, columns = ['word', 'count'])

plt.figure(figsize = (20, 20))
plt.bar(df_counts['word'], df_counts['count'], align = 'center')
plt.xticks(rotation = 'vertical')
plt.ylabel('Word Count')
plt.title('The Top 20 Words in My Twitter Stream')
plt.savefig('Plot.png')

