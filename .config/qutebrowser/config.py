config.load_autoconfig()

config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.bind("m", "spawn mpv {url}")
config.bind(";m", "hint links spawn mpv {hint-url}")

c.url.start_pages = "https://youtube.com"
c.completion.shrink = True
c.editor.command = ["alacritty", "-e", "nvim", "{}"]
c.downloads.location.directory = "~/dls"
c.keyhint.delay = 200
c.spellcheck.languages = ["en-US"]

c.tabs.background = True
c.tabs.show = "multiple"

# privacy
c.content.cookies.store = False
c.content.geolocation = "ask"
c.content.cookies.accept = "no-3rdparty"
