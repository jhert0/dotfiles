config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.url.start_pages = "https://youtube.com"
c.editor.command = ["emacs '{}'"]
c.scrolling.smooth = True
c.content.geolocation = 'ask'
