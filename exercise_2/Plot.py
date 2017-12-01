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
df_counts.set_index(['word'], inplace = True)

plt.clf()
plt.figure(figsize = (15, 15))
df_counts.plot(kind = 'bar', title = 'The Top 20 Words in My Twitter Stream', colormap = 'jet_r', rot = 90)
plt.ylabel('Word Count')
plt.savefig('Plot.png')

