from binds_ru import bind_russian

config.load_autoconfig(False)

bind_russian(config)

c.content.geolocation = False
c.content.headers.accept_language = 'ru-RU,ru'
c.content.javascript.enabled = False

c.downloads.remove_finished = 0

ui_size = 13
content_size = 26
c.zoom.default = 125
c.fonts.completion.category = 'bold %dpt monospace' % ui_size
c.fonts.completion.entry = '%dpt monospace' % ui_size
c.fonts.debug_console = '%dpt monospace' % ui_size
c.fonts.downloads = '%dpt monospace' % ui_size
c.fonts.hints = 'bold %dpt monospace' % (ui_size-1)
c.fonts.keyhint = '%dpt monospace' % ui_size
c.fonts.messages.error = '%dpt monospace' % ui_size
c.fonts.messages.info = '%dpt monospace' % ui_size
c.fonts.messages.warning = '%dpt monospace' % ui_size
c.fonts.prompts = '%dpt sans-serif' % ui_size
c.fonts.statusbar = '%dpt monospace' % ui_size
c.fonts.web.size.default = content_size
c.fonts.web.size.default_fixed = content_size
c.fonts.web.size.minimum = content_size
c.fonts.web.size.minimum_logical = content_size

c.hints.chars = 'aoeuhtnsåäöpgcrl.qjkmwvz'

c.tabs.favicons.show = 'never'
c.tabs.indicator.width = 0

config.bind('e', 'hint')
config.bind('E', 'hint all tab')
config.bind('p', 'spawn ~/scripts/play-video.sh {url}')
config.bind('P', 'hint links spawn ~/scripts/play-video.sh {hint-url}')
config.bind('q', 'spawn ~/scripts/play-video.sh -q {url}')
config.bind('Q', 'hint links spawn ~/scripts/play-video.sh -q {hint-url}')
