#!/usr/bin/env python3

from rofi import Rofi
import pulsectl, subprocess

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  # Get name of sink
  sink_name = rofi.text_entry("Create sink")
  if sink_name == None:
    return
  sink_description = "(Virtual) " + sink_name
  sink_name = sink_name.replace(" ", "")

  # Make it
  sink_id = pulse.module_load('module-null-sink', 'sink_name=%s ' % sink_name)

  print("Sink id: %s" % sink_id)
  
  # Set props and whatnot to sane values
  subprocess.run(["pacmd", "update-sink-proplist", sink_name, 'device.description="%s"' % sink_description])
  subprocess.run(["pacmd", "update-source-proplist", sink_name + '.monitor', 'device.description="%s"' % sink_description]) 


if __name__ == '__main__':
  main()