runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
:syntax on
:colorscheme koehler
:set si
:set relativenumber

:hi VertSplit ctermbg=green ctermfg=22
:hi StatusLine ctermbg=green ctermfg=22
:hi StatusLineNC ctermbg=green ctermfg=22

:nnoremap <C-n> :NERDTreeToggle<CR>

function! Synctex()
	" remove silent for debugging
	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>

augroup filetypedetect
	au! BufNewFile,BufRead *.inc setf php | set tabstop=2
	au! BufNewFile,BufRead * if &ft == 'php'||&ft == 'html' | set tabstop=2 | endif
	au! BufNewFile,BufRead * if &ft == 'css' | set tabstop=3 | endif
	au! BufNewFile,BufRead * if &ft == 'cpp'||&ft == 'c' | set tabstop=4 | endif
	au! BufNewFile,BufRead * if &ft == 'tex' | set tabstop=3 | endif
augroup END

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
