import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

if len(sys.argv) != 2:
    print 'word argument missing'
    exit(1)

word = sys.argv[1]

print 'word is' , word

conn = psycopg2.connect(database = 'tcount', user = 'postgres', password = 'pass', host = 'localhost', port = '5432')

cur = conn.cursor()

cur.execute('update tweetwordcount set count = count + 1 where word = %s', (word, ))

print 'number of updated rows', cur.rowcount

if cur.rowcount == 0:
    cur.execute('insert into tweetwordcount (word, count) values (%s, 1)', (word, ))

conn.commit()

cur.execute('select word, count from tweetwordcount')
records = cur.fetchall()
for rec in records:
    print 'word = ', rec[0]
    print 'count = ', rec[1], '\n'

conn.commit()

conn.close()

