runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
:colorscheme koehler
:set si
:set nu

:nnoremap <C-n> :NERDTreeToggle<CR>

augroup filetypedetect
	au! BufNewFile,BufRead *.inc if getline(1) =~ '<' | setf php | endif
	au! BufNewFile,BufRead * if &ft == 'php'||&ft == 'html' | set tabstop=2 | endif
augroup END
