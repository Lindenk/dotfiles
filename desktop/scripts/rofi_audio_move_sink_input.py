#!/usr/bin/env python3

#Uses libraries python-rofi and pulsectl

from rofi import Rofi
import pulsectl, sys

SINK_ALIASES = {
  'Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Stereo",
  'PCM2912A Audio Codec Analog Stereo': "PCM2912A Audio Codec Analog Stereo",
}


def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  # Ask user for a sink-input to move
  sink_inputs = pulse.sink_input_list()

  selections = ['All']
  for si in sink_inputs:
    try:
      selections.append(si.proplist['application.name'] + ': ' + si.proplist['media.name'])
    except KeyError:
      selections.append(si.proplist['media.name'])

  sink_input_index, _ = rofi.select("Select sink-input to move", selections)

  if sink_input_index == -1: # They hit escape
    return

  # convert to pulse sink-input index or -1 if all was selected
  sink_input_index = -1 if sink_input_index == 0 else sink_inputs[sink_input_index-1].index


  # Ask user which sink to move it to
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

  # Move the sink-input to the sink
  if sink_input_index == -1:
    # Move all
    for si in sink_inputs:
      pulse.sink_input_move(si.index, sinks[sink_index].index)
  else:
    pulse.sink_input_move(sink_input_index, sinks[sink_index].index)


if __name__ == '__main__':
  main()