" Set up pathogen.vim to load bundles
call pathogen#runtime_append_all_bundles()

" Set up indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smarttab
set guioptions=egmt

" Customize statusline
set laststatus=2  " Always show status line
set ruler
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P <- default statusline

" Some more useful stuff
set incsearch     " Turn on incremental search 
set mouse=a       " Use the mouse everywhere possible
set hidden        " Hide buffer instead of killing when changing file
set autowrite     " Write buffer automatically on hide
set autoread      " Automatically re-read changed files

" Enable filetype plugins and switch on syntax highlighting
filetype plugin indent on
syntax on

autocmd BufNewFile,BufRead *.thor     setfiletype ruby
autocmd BufNewFile,BufRead Thorfile   setfiletype ruby
autocmd BufNewFile,BufRead SConstruct setfiletype python

" Tweak mkd highlighting to recognise nanoc YAML front matter
autocmd BufNewFile,BufRead *.md       syntax match Comment /\%^---\_.\{-}---$/

" Highlight the current line and/or column
"highlight CursorLine   cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
"highlight CursorColumn cterm=NONE ctermbg=lightblue ctermfg=NONE guibg=#e4e4ff guifg=NONE 
set cursorline
" set cursorcolumn

" NERDTree options
let NERDTreeIgnore=['\.git$', '\v\.(aux|bbl|blg|latexmain|log|lol|nav|out|snm|tmproj|toc|vrb)$', '\~$']

" GUI stuff
if has("gui_running")
  set background=light
  colorscheme solarized

  set guioptions-=T
endif

" GTK+ specific stuff
if has("gui_gtk")
  set guifont=Droid\ Sans\ Mono\ 12
endif


" MacVim specific stuff
if has("gui_macvim")
  "set transparency=8
  set guifont=Menlo:h12,Droid\ Sans\ Mono:h12
endif

" Abbreviations
ia _csct Centre for Sustainable Chemical Technologies
ia _dtc Doctoral Training Centre
ia _sct Sustainable Chemical Technologies
ia _uob University of Bath

" Make the Y key mapping work like D and C
map Y y$

" Disable the arrow keys(!)
map  <Up>    <nop>
map  <Down>  <nop>
map  <Left>  <nop>
map  <Right> <nop>
imap <Up>    <nop>
imap <Down>  <nop>
imap <Left>  <nop>
imap <Right> <nop>
