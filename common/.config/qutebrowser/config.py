ui_size = 12
c.fonts.monospace = 'Source Code Pro'
c.fonts.completion.entry = '%dpt monospace' % ui_size
c.fonts.completion.category = 'bold %dpt monospace' % ui_size
c.fonts.debug_console = '%dpt monospace' % ui_size
c.fonts.downloads = '%dpt monospace' % ui_size
c.fonts.hints = 'bold %dpt monospace' % (ui_size-1)
c.fonts.keyhint = '%dpt monospace' % ui_size
c.fonts.messages.error = '%dpt monospace' % ui_size
c.fonts.messages.info = '%dpt monospace' % ui_size
c.fonts.messages.warning = '%dpt monospace' % ui_size
c.fonts.prompts = '%dpt sans-serif' % ui_size
c.fonts.statusbar = '%dpt monospace' % ui_size
c.fonts.tabs = '%dpt monospace' % ui_size

content_size = 18
c.fonts.web.size.default = content_size
c.fonts.web.size.default_fixed = content_size
c.fonts.web.size.minimum = content_size
c.fonts.web.size.minimum_logical = content_size

c.content.geolocation = False
c.content.headers.accept_language = 'ru-RU,ru'

c.downloads.remove_finished = 0

config.bind('e', 'hint')
config.bind('E', 'hint all tab')
config.bind('q', 'spawn ~/scripts/stream.sh {url}');
config.bind('Q', 'hint links spawn ~/scripts/stream.sh {hint-url}');