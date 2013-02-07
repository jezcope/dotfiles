setlocal textwidth=79
setlocal formatoptions=q
setlocal spell spelllang=en_gb
setlocal equalprg=pandoc\ -f\ markdown\ -t\ markdown\ --columns=79 "\ --reference-links

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal linebreak
silent! setlocal breakindent
silent! setlocal breakindentshift=4

nmap <Leader>ft vip:!~/Library/Application\ Support/MultiMarkdown/Utilities/table_cleanup.pl<CR>
