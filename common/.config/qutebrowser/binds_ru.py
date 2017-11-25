def bind_russian(config):
#movement
    config.bind('о', 'scroll left')
    config.bind('с', 'scroll down')
    config.bind('м', 'scroll up')
    config.bind('з', 'scroll right')
    config.bind('О', 'back')
    config.bind('С', 'tab-next')
    config.bind('М', 'tab-prev')
    config.bind('З', 'forward')
    config.bind('Г', 'move-to-end-of-document')
    config.bind('ГГ', 'move-to-start-of-document')
    config.bind('д', 'search-next')
    config.bind('Д', 'search-prev')
    config.bind('<Ctrl-Д>', 'command-history-next')
    config.bind('<Ctrl-К>', 'command-history-prev')

    config.bind('щ', 'reload')
    config.bind('Щ', 'reload -f')
    config.bind('р', 'tab-close')
    config.bind('Р', 'tab-close -o')

#addresses
    config.bind('ь', 'quickmark-save')
    config.bind('т', 'set-cmd-text -s :quickmark-load')
    config.bind('Т', 'set-cmd-text -s :quickmark-load -t')
    config.bind('ы', 'set-cmd-text -s :open')
    config.bind('Ы', 'set-cmd-text -s :open -t')
    config.bind('гы', 'set-cmd-text -s :open {url:pretty}')

    config.bind('<Ctrl-и>', 'prompt-open-download')
    config.bind('д', 'prompt-accept no')
    config.bind('е', 'prompt-accept yes')

    config.bind('в', 'hint')
    config.bind('В', 'hint all tab')
    config.bind('ч', 'spawn ~/scripts/stream.sh {url}')
    config.bind('Ч', 'hint links spawn ~/scripts/stream.sh {hint-url}')
