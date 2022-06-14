import yaml

c.bindings.default = {}
config.load_autoconfig(False)

with (config.configdir / 'keys.yaml').open() as f:
  yaml_data = yaml.full_load(f)

for mode, bindings in yaml_data.items():
  for k, command in bindings.items():
    config.bind(k, command, mode=mode)

# Start pages
#c.url.start_pages = ["https://gmail.com", "https://fastmail.com", "https://discordapp.com"]

# Config
c.scrolling.smooth = True
#c.content.developer_extras = True

c.downloads.location.directory = "~/downloads"
#c.downloads.open_dispatcher = "open {}"

c.editor.command = ["code", "-n", "{}"]

c.hints.chars = "asdfghjkl;"

c.auto_save.session =  True
c.content.cookies.accept = 'all'
c.input.insert_mode.leave_on_load = False

#with config.pattern("*://app.roll20.net/editor/*") as p:
#  p.input.insert_mode.auto_leave = False
c.input.insert_mode.auto_leave = False

config.set('content.notifications.enabled', True, '*://discord.com')
config.set('content.notifications.enabled', True, '*://messages.google.com')

config.set('content.media.audio_capture', True, '*://messages.google.com')
config.set('content.media.audio_capture', True, '*://messages.google.com')

config.set('content.register_protocol_handler', True, '*://mail.google.com')

config.set('editor.command', ['alacritty', '-e', 'helix', '{}'])
# Colors
#c.colors.statusbar.normal.bg = "#00000080"
