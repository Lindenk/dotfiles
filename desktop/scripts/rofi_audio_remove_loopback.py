#!/usr/bin/env python3

from rofi import Rofi
import pulsectl, subprocess, re

SOURCE_ALIASES = {
  'Monitor of Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Stereo Monitor",
  'PCM2912A Audio Codec Analog Mono': "USB Area Mic",
  'alsa_input.usb-Burr-Brown_from_TI_USB_audio_CODEC-00.analog-mono': "USB Area Mic"
}
SINK_ALIASES = {
  'Family 17h (Models 00h-0fh) HD Audio Controller Analog Stereo': "Builtin Analog Stereo",
  'alsa_output.pci-0000_12_00.3.analog-stereo': "Builtin Analog Stereo",
  'PCM2912A Audio Codec Analog Stereo': "USB Area Mic",
}

def main():
  pulse = pulsectl.Pulse()
  rofi = Rofi()

  # Get all loopback modules
  raw_loopbacks = list(filter(lambda m: m.name == 'module-loopback', pulse.module_list()))

  # Parse out the source and sink names of each loopback
  sink_re = re.compile('sink="?([^ "]+)"?')
  source_re = re.compile('source="?([^ "]+)"?')

  loopbacks = []
  for lb in raw_loopbacks:
    sink_name = sink_re.search(lb.argument).group(1)
    source_name = source_re.search(lb.argument).group(1)

    sink_name = SINK_ALIASES[sink_name] if sink_name in SINK_ALIASES else sink_name
    source_name = SOURCE_ALIASES[source_name] if source_name in SOURCE_ALIASES else source_name

    loopbacks.append((lb.index, source_name, sink_name))

  # Have the user select a loopback
  loopback_index, _ = rofi.select("Delete loopback", [l[1] + " -> " + l[2] for l in loopbacks])
  if loopback_index == -1: # The user hit escape
    return

  # Remove it
  pulse.module_unload(loopbacks[loopback_index][0])
  

if __name__ == '__main__':
  main()