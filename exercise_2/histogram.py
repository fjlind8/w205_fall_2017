import sys
import psycopg2

# If there's an incorrect number of arguments entered, or improperly formatted, ask the user to resubmit
if (len(sys.argv) != 3) or (sys.argv[1] > sys.argv[2]):
    print '\nPlease enter two integers with no comma separator, the first being less than or equal to the second\n'
    exit(1)
else:
    # Set the boundaries and connect to the database
    k1   = int(sys.argv[1])
    k2   = int(sys.argv[2])
    conn = psycopg2.connect(database = 'tcount', user = 'postgres', password = 'pass', host = 'localhost', port = '5432')
    cur  = conn.cursor()

    cur.execute('select * from tweetwordcount')

    # Look for the words that fall between the integers k1 and k2
    words          = cur.fetchall()
    words_in_range = [i for i in words if int(i[1]) >= k1 and int(i[1]) <= k2]

    # If there are words with counts between the integers, print them in descending count order
    if len(words_in_range) > 0:
        sorted_words = sorted(words_in_range, key = lambda x: (x[1], x[0].lower()), reverse = True)

        print

        for i in sorted_words:
            print i

        print
    else:
        print '\nThere are no words with counts between {} and {}\n'.format(k1, k2)


