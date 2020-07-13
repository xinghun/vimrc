" for cscope color
hi ModeMsg ctermfg=Green

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
