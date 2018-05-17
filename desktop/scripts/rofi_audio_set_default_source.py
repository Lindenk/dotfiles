#!/usr/bin/env python3

#Uses libraries python-rofi and pulsectl

from rofi import Rofi
import pulsectl, sys

SOURCE_ALIASES = {
  #'Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Stereo",
  #'PCM2912A Audio Codec Analog Stereo': "PCM2912A Audio Codec Analog Stereo",
}

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  sources = pulse.source_list()
  current_default_name = pulse.server_info().default_source_name
  current_default = None
  for i, s in enumerate(sources):
    if s.name == current_default_name:
      current_default = i

  if current_default == None:
    print("Couldn't find the default source?")
    return

  source_index, _ = rofi.select("Select default source", [s.description if s.description not in SOURCE_ALIASES else SOURCE_ALIASES[s.description] for s in sources], select=current_default)
  if source_index == -1:
    return

  pulse.default_set(sources[source_index])


if __name__ == '__main__':
  main()