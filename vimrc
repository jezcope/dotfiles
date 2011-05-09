" Set up indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smarttab

" Some more useful stuff
set incsearch     " Turn on incremental search 
set mouse=a       " Use the mouse everywhere possible
set hidden        " Hide buffer instead of killing when changing file
set autowrite     " Write buffer automatically on hide
set autoread      " Automatically re-read changed files

" Enable filetype plugins and switch on syntax highlighting
filetype plugin indent on
syntax on

" Highlight the current line and/or column
highlight CursorLine   cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
highlight CursorColumn cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
set cursorline
" set cursorcolumn

" NERDTree options
let NERDTreeIgnore=['\.git$', '\.aux$', '\.nav$', '\.out$', '\.snm$', '\.toc$', '\.log$', '\.vrb$', '\~$']
