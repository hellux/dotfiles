c.fonts.hints = 'bold 7pt monospace'
c.fonts.monospace = 'Source Code Pro'
c.fonts.web.size.default = 18
c.fonts.web.size.default_fixed = 18
c.fonts.web.size.minimum = 18
c.fonts.web.size.minimum_logical = 18

c.content.geolocation = False
c.content.headers.accept_language = "ru-RU,ru"

c.downloads.remove_finished = 0

config.bind('e', 'hint')
config.bind('E', 'hint all tab')
config.bind('q', 'spawn mpv {url}');
config.bind('Q', 'hint links spawn mpv {hint-url}');
