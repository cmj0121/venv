" =======================================
" VIM general setting for my develop env
" author: cmj<cmj@cmj.tw>
" =======================================

" Section I - general setting
set tabstop=4 shiftwidth=4
set foldenable foldmethod=indent foldignore=
set autoread
set nu colorcolumn=128 ruler
set hlsearch incsearch
set exrc modelines=4
syntax on

" Section II - Hotkey
imap <S-tab> <c-p>
map <C-g> :w <CR> :!make clean && make -j4<CR>
map <C-w> :tabclose<CR>
map <C-n> :tabnext<CR>
map <C-p> :tabprevious<CR>
map	<F5> :! cscope -bR<CR> :cs reset<CR> : echo "Rebuild cscope" <CR>
" **SPECIAL** in OSX
if has("unix") && has("cscope")
	let s:uname = system("uname")

	if s:uname == "Darwin\n"
		if filereadable("cscope.out")
			cs add cscope.out
		endif

		map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR><Tab>
		map <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		map <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR><Tab>
		map <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR><Tab>
		map <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR><Tab>
		map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR><Tab>
		map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR><Tab>
		map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR><Tab>
	endif
endif

