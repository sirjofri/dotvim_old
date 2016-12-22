runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
:colorscheme koehler
:set si
:set nu

:nnoremap <C-n> :NERDTreeToggle<CR>

augroup filetypedetect
	au! BufNewFile,BufRead *.inc setf php | set tabstop=2
	au! BufNewFile,BufRead * if &ft == 'php'||&ft == 'html' | set tabstop=2 | endif
	au! BufNewFile,BufRead * if &ft == 'css' | set tabstop=3 | endif
augroup END
