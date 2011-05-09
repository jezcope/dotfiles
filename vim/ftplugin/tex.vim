" LaTeX-suite options
let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" Additional environments
let g:Tex_Env_frame = "\\begin{frame}{<+title+>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_Env_column = "\\begin{column}{<+width+>}\<CR><++>\<CR>\\end{column}<++>"
let g:Tex_Env_columns = "\\begin{columns}\<CR>\\begin{column}{<+width+>}\<CR><++>\<CR>\\end{column}\<CR><++>\<CR>\\end{columns}"
