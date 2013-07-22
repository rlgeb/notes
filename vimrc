" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

"display line numbers
set number

"Syntax Highlighting
syntax on


"1000 undos
set undolevels=1000

"show matching brakets
set showmatch


"Indents by 4 columns
set tabstop=4

" >> and << indents/unindents by 4 columns
set shiftwidth=4

" Use tabs instead of spaces for PHP files (coding standards)
au BufRead,BufNewFile *.php set noexpandtab

" Use tabs instead of spaces for PHP files (coding standards)
au BufRead,BufNewFile *.mustache set noexpandtab

" Tab produces a number of spaces equal to `tabstop`
set expandtab

" Navigation shortcuts
:map <C-h> <C-w>h
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-l> <C-w>l


" Highlight search matches
set hlsearch

" JSON indentation
au BufRead,BufNewFile *.json set tabstop=2
au BufRead,BufNewFile *.json set shiftwidth=2



