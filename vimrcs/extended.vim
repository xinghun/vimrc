"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => GUI related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme
set background=dark
try
    colorscheme mymrkn256
catch
endtry

set cursorline

" set vim-signify color after colorscheme
highlight SignColumn        ctermfg=NONE   ctermbg=0 guibg=NONE gui=NONE
"highlight SignifySignAdd    ctermfg=42     ctermbg=0 guifg=#00cc7f cterm=NONE gui=NONE
"highlight SignifySignDelete ctermfg=234    ctermbg=0 guifg=#8b0000 cterm=NONE gui=NONE
"highlight SignifySignChange ctermfg=220    ctermbg=0 guifg=#ffd700 cterm=NONE gui=NONE


