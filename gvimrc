" Window size
set winwidth=85
let g:halfsize = 86
let g:fullsize = 171
set lines=50
let &columns = g:halfsize

" Font
set guifont=Monaco:h10.00

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

