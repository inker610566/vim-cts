function! EncodeUriComponent(arg)
	let filtered1 = substitute(a:arg, "=", "%3D", "g")
	let filtered2 = substitute(filtered1, "&", "%26", "g")
	return filtered2
endfunction

function! ShellEscape(arg)
	return escape(a:arg, "\"")
endfunction

function! Pronounce(arg)
	return "curl -L -G http://tts-api.com/tts.mp3 --data-urlencode \"q=".ShellEscape(EncodeUriComponent(a:arg))."\" > x.mp3;afplay x.mp3;"
endfunction

function! Cts()
	let lines = getline("v", ".")
	call map(lines, "Pronounce(v:val)")
	let cmd = ":\<bs>\<bs>\<bs>\<bs>\<bs>!" . join(lines) . "\<CR>"
	return cmd
endfunction
vmap <expr> v Cts()
