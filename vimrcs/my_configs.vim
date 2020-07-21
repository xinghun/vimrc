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
highlight SignifySignAdd    ctermfg=42     ctermbg=0 guifg=#00cc7f cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=234    ctermbg=0 guifg=#8b0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=220    ctermbg=0 guifg=#ffd700 cterm=NONE gui=NONE


set cursorline

" get rid of '|' characters that appears on vertical split
" note the significant whitespace after the '\' character
set fillchars+=vert:\ 


"Show the Subversion 'blame' annotation for the current file, in a narrow
"  window to the left of it.
"Usage:
"  'gb' or ':Blame'
"  To get rid of it, close or delete the annotation buffer.
"Bugs:
"  If the source file buffer has unsaved changes, these aren't noticed and
"    the annotations won't align properly. Should either warn or preferably
"    annotate the actual buffer contents rather than the last saved version.
"  When annotating the same source file again, it creates a new annotation
"    buffer. It should re-use the existing one if it still exists.
"Possible enhancements:
"  When invoked on a revnum in a Blame window, re-blame same file up to the
"    previous revision.
"  Dynamically synchronize when edits are made to the source file.
function s:svnBlame()
   let line = line(".")
   setlocal nowrap
   " create a new window at the left-hand side
   aboveleft 19vnew
   " blame
   %!svn blame -v "#"
   setlocal nomodified readonly buftype=nofile nowrap winwidth=1
   setlocal nonumber
   if has('&relativenumber') | setlocal norelativenumber | endif
   " return to original line
   exec "normal " . line . "G"
   " synchronize scrolling, and return to original window
   setlocal scrollbind
   setlocal cursorbind
   wincmd p
   setlocal scrollbind
   setlocal cursorbind
   syncbind
endfunction
map sb :call <SID>svnBlame()<CR>
command Blame call s:svnBlame()

function s:svnLog()
    let ret = system("svn log -l3 ".expand("%"))
    echo ret
endfunction
map sl :call <SID>svnLog()<CR>
command Log call s:svnLog()

