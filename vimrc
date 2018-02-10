runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype off
:syntax on
filetype plugin indent on
:colorscheme koehler
:set si
:set hls
:set relativenumber
:set number
:set so=3

:set encoding=utf-8
:set listchars=tab:→\ ,trail:·
:set list

" :help usr_25 - adds _j justify function
:packadd! justify

" see http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
:set viminfo='100,<50,s10,h,\"100,:20,%
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
if has("folding")
	function! UnfoldCur()
		if !&foldenable
			return
		endif
		let cl = line(".")
		if cl <= 1
			return
		endif
		let cf = foldlevel(cl)
		let uf = foldlevel(cl - 1)
		let min = (cf > uf ? uf : cf)
		if min
			execute "normal!" min."zo"
			return 1
		endif
	endfunction
endif
augroup resCur
	autocmd!
	if has("folding")
		autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
	else
		autocmd BufWinEnter * call ResCur()
	endif
augroup END

:hi VertSplit ctermbg=green ctermfg=0
:hi StatusLine ctermbg=4 ctermfg=green
:hi StatusLineNC ctermbg=green ctermfg=4 cterm=NONE

:nnoremap <C-n> :NERDTreeToggle<CR>
:nnoremap <C-u> :noh<CR>

function! HighlightTags()
	if filereadable("tags")
		let l:hltime = getftime("tags.vim")
		let l:tagtime = getftime("tags")
		if l:hltime < l:tagtime
			sp tags
			execute "%s/^\\([^	:]*:\\)\\=\\([^	]*\\).*/syntax keyword Tag \\2/"
			execute "wq! tags.vim"
		endif
		so tags.vim
	endif
endfunction

command! Thl :call HighlightTags()

function! Synctex()
	" remove silent for debugging
	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>

augroup filetypedetect
	au! BufNewFile,BufRead *.inc setf php | set tabstop=2
	au! BufNewFile,BufRead * if &ft == 'php'||&ft == 'html' | set tabstop=2 | set sw=2 | endif
	au! BufNewFile,BufRead * if &ft == 'css' | set tabstop=3 | set sw=3 | endif
augroup END

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

if filereadable("./tags.vim")
	so tags.vim
endif

if filereadable(expand("~/.vim/locals.vim"))
	source ~/.vim/locals.vim
endif

if filereadable(".settings.vim")
	source .settings.vim
endif

" vim:ts=3:sw=3:noet
