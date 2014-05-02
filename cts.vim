function! Cts()
	let st = getpos("v")[1:2]
	let dt = getpos(".")[1:2]
	let lines = ""
	for i in range(st[0], dt[0])
		let lines = lines . getline(i)
		\[(i == st[0] ? st[1] : 1)-1:min([len(getline(i)),(i==dt[0]?dt[1]:0)])-1]
		if i != dt[0]
			let lines = lines . " endline "
		endif
	endfor
	call system("curl -L -G http://tts-api.com/tts.mp3 --data-urlencode 'q=".lines."' > x.mp3")
	return ":\<bs>\<bs>\<bs>\<bs>\<bs>!afplay x.mp3\<CR>"
endfunction
vmap <expr> c Cts()
