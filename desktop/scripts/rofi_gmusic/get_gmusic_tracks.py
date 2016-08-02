#!/bin/python2

import sys
from gmusicapi import Mobileclient

if len(sys.argv) < 2:
    print "Please provide a query string"
    sys.exit(1)
song_name = sys.argv[1]

api = Mobileclient()
is_logged_in = api.login('ztaticnull', 'kkjyumnguxiqiixx','0000000000000000')

if not is_logged_in:
    print "Could not authenticate"
    sys.exit(1)

results = api.search_all_access(song_name, max_results=100)

songs = [(s['track']['storeId'],
          s['track']['artist'], 
          s['track']['title'])
          for s in results['song_hits']]

for s in songs:
    s = [x.encode('utf-8') for x in s]
    print "%s:%s - %s" % tuple(s)
