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

:hi VertSplit ctermbg=green ctermfg=0
:hi StatusLine ctermbg=4 ctermfg=green
:hi StatusLineNC ctermbg=green ctermfg=4 cterm=NONE

:nnoremap <C-n> :NERDTreeToggle<CR>
:nnoremap <C-u> :noh<CR>

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
