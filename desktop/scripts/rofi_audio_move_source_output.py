#!/usr/bin/env python3

#Uses libraries python-rofi and pulsectl

from rofi import Rofi
import pulsectl, sys

SOURCE_ALIASES = {
  'Monitor of Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Input",
  'PCM2912A Audio Codec Analog Mono': "USB Area Microphone",
}


def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  # Ask user for a source-output to move
  source_outputs = pulse.source_output_list()

  selections = ['All']
  for so in source_outputs:
    try:
      selections.append(so.proplist['application.name'] + ': ' + so.proplist['media.name'])
    except KeyError:
      selections.append(so.proplist['media.name'])

  source_output_index, _ = rofi.select("Select source-output to move", selections)

  if source_output_index == -1: # They hit escape
    return

  # convert to pulse source-output index or -1 if all was selected
  source_output_index = -1 if source_output_index == 0 else source_outputs[source_output_index-1].index


  # Ask user which source to move it to
  sources = pulse.source_list()
  current_default_name = pulse.server_info().default_source_name
  for i, s in enumerate(sources):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default sink?")
    return

  source_index, _ = rofi.select("Select destination source", [s.description if s.description not in SOURCE_ALIASES else SOURCE_ALIASES[s.description] for s in sources], select=current_default)
  if source_index == -1: # They hit escape
    return

  # Move the source-output to the source
  if source_output_index == -1:
    # Move all
    for si in source_outputs:
      pulse.source_output_move(si.index, sources[source_index].index)
  else:
    pulse.source_output_move(source_output_index, sources[source_index].index)


if __name__ == '__main__':
  main()