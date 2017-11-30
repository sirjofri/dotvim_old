if exists("b:did_tex_autocomplete")
	finish
endif
let b:did_tex_autocomplete = 1

setlocal textwidth=78
setlocal colorcolumn=+0
setlocal tabstop=3
setlocal shiftwidth=3

if filereadable("Makefile")
	set makeprg=make\ 2>/dev/null\ &>/dev/null
else
	set makeprg=pdflatex\ -interaction=nonstopmode\ -halt-on-error\ -file-line-error\ -synctex=1\ %\ 2>/dev/null\ &>/dev/null
endif

function! <SID>Compile()
	silent! update
	silent exec "silent! make"
	redraw!
endfunction

au! BufWritePost,InsertLeave,TextChanged <buffer> silent call <SID>Compile()
