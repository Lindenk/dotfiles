#!/usr/bin/env python3

from rofi import Rofi
import pulsectl, subprocess

SOURCE_ALIASES = {
  'Monitor of Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Input",
  'PCM2912A Audio Codec Analog Mono': "USB Area Microphone",
}
SINK_ALIASES = {
  'Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Stereo",
  'PCM2912A Audio Codec Analog Stereo': "PCM2912A Audio Codec Analog Stereo",
}

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()
  
  # Ask user which source to link
  sources = pulse.source_list()
  current_default_name = pulse.server_info().default_source_name
  for i, s in enumerate(sources):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  source_index, _ = rofi.select("Select receiving source", [s.description if s.description not in SOURCE_ALIASES else SOURCE_ALIASES[s.description] for s in sources], select=current_default)
  if source_index == -1: # They hit escape
    return


  # Ask user which sink to link
  sinks = pulse.sink_list()
  current_default_name = pulse.server_info().default_sink_name
  for i, s in enumerate(sinks):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  sink_index, _ = rofi.select("Select destination sink", [s.description if s.description not in SINK_ALIASES else SINK_ALIASES[s.description] for s in sinks], select=current_default)
  if sink_index == -1: # They hit escape
    return

  # Link them!
  print("Linking: %s to %s" % (sources[source_index].name, sinks[sink_index].name))
  loop_id = pulse.module_load('module-loopback', 'source="%s" sink="%s" latency_msec=1' % (sources[source_index].name, sinks[sink_index].name))
  print("Loop id: %s" % loop_id)

  if loop_id > 100000:
    print("Invalid loop id")
    return

  # Find the newly created sink-input
  loop_sink_input = None
  for si in pulse.sink_input_list():
    if si.owner_module == loop_id:
      print("Sink-input: %s" % si.index)
      loop_sink_input = si

  if loop_sink_input == None:
    print("Could not find newly created sink-input")
    return

  # Find the newly created source-output
  loop_source_output = None
  for so in pulse.source_output_list():
    if so.owner_module == loop_id:
      print("Source-output: %s" % so.index)
      loop_source_output = so

  if loop_source_output == None:
    print("Could not find newly created source-output")
    return

  
  # Set props and whatnot to sane values
  #subprocess.run(["pacmd", "update-sink-input-proplist", str(loop_sink_input.index), "application.name=VLoop"])
  #subprocess.run(["pacmd", "update-sink-input-proplist", str(loop_sink_input.index), "media.name=%s" % sink_name])
#
  #subprocess.run(["pacmd", "update-source-output-proplist", str(loop_source_output.index), "application.name=VLoop"])
  #subprocess.run(["pacmd", "update-source-output-proplist", str(loop_source_output.index), "media.name=%s" % sink_name])
  


if __name__ == '__main__':
  main()