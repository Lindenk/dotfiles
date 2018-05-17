#!/usr/bin/env python3

from rofi import Rofi
import pulsectl, subprocess, re

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  # Get all loopback modules
  raw_loopbacks = list(filter(lambda m: m.name == 'module-null-sink', pulse.module_list()))

  # Parse out the source and sink names of each module
  sink_re = re.compile('sink_name="?([^ "]+)"?')

  loopbacks = []
  for lb in raw_loopbacks:
    sink_name = sink_re.search(lb.argument).group(1)
    loopbacks.append((lb.index, sink_name))

  # Have the user select a loopback
  loopback_index, _ = rofi.select("Delete loopback", [l[1] for l in loopbacks])
  if loopback_index == -1: # The user hit escape
    return

  # Remove it
  pulse.module_unload(loopbacks[loopback_index][0])
  

if __name__ == '__main__':
  main()