c.fonts.monospace = 'Source Code Pro'
c.fonts.completion.entry = "11pt monospace"
c.fonts.completion.category = "bold 11pt monospace"
c.fonts.debug_console = "11pt monospace"
c.fonts.downloads = "11pt monospace"
c.fonts.hints = "bold 10pt monospace"
c.fonts.keyhint = "11pt monospace"
c.fonts.messages.error = "11pt monospace"
c.fonts.messages.info = "11pt monospace"
c.fonts.messages.warning = "11pt monospace"
c.fonts.prompts = "11pt sans-serif"
c.fonts.statusbar = "11pt monospace"
c.fonts.tabs = "11pt monospace"
c.fonts.web.size.default = 18
c.fonts.web.size.default_fixed = 18
c.fonts.web.size.minimum = 18
c.fonts.web.size.minimum_logical = 18

c.content.geolocation = False
c.content.headers.accept_language = "ru-RU,ru"

c.downloads.remove_finished = 0

config.bind('e', 'hint')
config.bind('E', 'hint all tab')
config.bind('q', 'spawn ~/scripts/stream.sh {url}');
config.bind('Q', 'hint links spawn ~/scripts/stream.sh {hint-url}');
