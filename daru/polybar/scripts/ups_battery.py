#!/usr/bin/env python3

import re, sys

def get_battery():
  batt_line = None
  with open("/var/log/apcupsd.status") as f:
    for l in f.readlines():
      if re.match("BCHARGE", l):
        batt_line = l

  

  return float(batt_line.split()[2])


if __name__ == '__main__':
  try:
    batt_level = get_battery()
  except:
    sys.exit(1)

  batt_symbol = ""

  # Too full, don't print
  if batt_level > 97:
    sys.exit(0)
  # Full
  elif batt_level > 80:
    batt_symbol = "\uf240"
  # 3/4
  elif batt_level > 60:
    batt_symbol = "\uf241"
  # 1/2
  elif batt_level > 40:
    batt_symbol = "\uf242"
  # 1/4
  elif batt_level > 20:
    batt_symbol = "\uf243"
  # empty
  else:
    batt_symbol = "\uf244"

  print("%s%s" % (batt_symbol, str(int(batt_level))))