config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.bind("m", "spawn mpv {url}")
config.bind("M", "hint links spawn mpv {hint-url}")

c.url.start_pages = "https://youtube.com"
c.completion.shrink = True
c.editor.command = ['emacsclient', '-c', '-a', ' ', '+{line}:{column}', '{}']
c.scrolling.smooth = True
c.content.geolocation = "ask"
c.tabs.background = True
c.downloads.location.directory = "~/dls"
c.keyhint.delay = 250
