vim-cts
=========================

Code To Speech Vim Plugin

Dependency:

	* The website http://tts-api.com is reachable.
	* curl from http://curl.haxx.se/download.html
	* afplay (mac buildin cli mp3 player)
	* both curl and afplay under $PATH

Usage:

	* Press c when the code under selected in visual mode with v

TODO:

	* support for V selection
	* solve the selected code to long problem (possibly break into many request)
	* cross-platform support (require cli mp3 player available on each platform)
