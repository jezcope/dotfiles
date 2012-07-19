" LaTeX-suite options
let g:Tex_CompileRule_pdf = 'lualatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:Tex_FoldedEnvironments = 'verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,frame'

" Additional environments
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<+title+>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_Env_column = "\\begin{column}{<+width+>}\<CR><++>\<CR>\\end{column}<++>"
let g:Tex_Env_columns = "\\begin{columns}\<CR>\\begin{column}{<+width+>}\<CR><++>\<CR>\\end{column}\<CR><++>\<CR>\\end{columns}"

" Enable <M-*> mappings in MacVim
if has("gui_macvim")
  set macmeta
endif

call IMAP("_csct", "Centre for Sustainable Chemical Technologies", "")
call IMAP("_dtc" , "Doctoral Training Centre"                    , "")
call IMAP("_sct" , "Sustainable Chemical Technologies"           , "")
call IMAP("_uob" , "University of Bath"                          , "")

set linebreak
set breakindent
set breakindentshift=2
