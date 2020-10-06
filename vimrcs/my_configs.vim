colorscheme mymrkn256

" compile single source file of codm
set makeprg=compile_single_file.py\ '%:p'
noremap <F9> :make<cr>
noremap <F10> :cn<cr>
noremap <F11> :cp<cr>
 
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" set vim-signify color after colorscheme
highlight SignColumn        ctermfg=NONE   ctermbg=0 guibg=NONE gui=NONE
"highlight SignifySignAdd    ctermfg=42     ctermbg=0 guifg=#00cc7f cterm=NONE gui=NONE
"highlight SignifySignDelete ctermfg=234    ctermbg=0 guifg=#8b0000 cterm=NONE gui=NONE
"highlight SignifySignChange ctermfg=220    ctermbg=0 guifg=#ffd700 cterm=NONE gui=NONE


set cursorline

" get rid of '|' characters that appears on vertical split
" note the significant whitespace after the '\' character
set fillchars+=vert:\ 

let g:clang_format_path='/data/home/wallenwang/toolchains/llvm-9.0.0/bin/clang-format'
if has('python')
    map <C-M> :pyf /data/home/wallenwang/toolchains/llvm-9.0.0/share/clang/clang-format.py<cr>
elseif has('python3')
    map <C-M> :py3f /data/home/wallenwang/toolchains/llvm-9.0.0/share/clang/clang-format.py<cr>
endif

" check highlight group under cursor
map <F6> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

