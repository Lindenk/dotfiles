import yaml

c.bindings.default = {}

with (config.configdir / 'keys.yaml').open() as f:
  yaml_data = yaml.load(f)

for mode, bindings in yaml_data.items():
  for k, command in bindings.items():
    config.bind(k, command, mode=mode)

# Start pages
c.url.start_pages = ["https://gmail.com", "https://fastmail.com", "https://discordapp.com"]

# Config
c.scrolling.smooth = True
c.content.developer_extras = True

c.downloads.location.directory = "~/downloads"
#c.downloads.open_dispatcher = "open {}"

c.editor.command = ["code", "-n", "{}"]

c.hints.chars = "asdfghjkl;"

c.auto_save.session =  True
