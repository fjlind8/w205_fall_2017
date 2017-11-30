import sys
import psycopg2

if len(sys.argv) > 2:
    print '\nPlease enter just a single word, or no words!\n'
    exit(1)
else:
    pass

conn = psycopg2.connect(database = 'tcount', user = 'postgres', password = 'pass', host = 'localhost', port = '5432')
cur  = conn.cursor()

if len(sys.argv) == 2:
    word = sys.argv[1]
    
    cur.execute('select * from tweetwordcount where word = %s', (word, ))
    
    word_count = cur.fetchall()
    
    if len(word_count) > 0:
        print '\nTotal number of occurrences of "{}": {}\n'.format(word, word_count[0][1])
    else:
        print '\nTotal number of occurrences of "{}": 0\n'.format(word)
else:
    cur.execute('select * from tweetwordcount')
    
    all_words = cur.fetchall()
    sorted_words = sorted(all_words, key = lambda x: x[0].lower())

    if len(sorted_words) > 0:
        print '\nOh boy. You\'re going to see every word we have...\n'
	for i in sorted_words:
	    print i
    else:
        print '\nThere are no words in the database table tweetwordcount\n'

conn.close()

