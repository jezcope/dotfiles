" Set up indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smarttab

" Hide and save buffers when editing another file
set hidden
set autowrite

" Some more useful stuff
set incsearch
set mouse=a

" Enable filetype plugins and switch on syntax highlighting
filetype plugin indent on
syntax on

" Highlight the current line and/or column
highlight CursorLine   cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
highlight CursorColumn cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
set cursorline
" set cursorcolumn
