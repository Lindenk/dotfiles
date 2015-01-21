#!/bin/env python
#python 3

import os, xmltodict

gameXMLPath = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'games.xml')

with open(gameXMLPath, 'r') as gfile:
  game_xml = gfile.read()

games = xmltodict.parse(game_xml)
games = games['gamesList']['games']['game']

for d in games:
  print("%s`%s" % (d['name'], d['appID']))

