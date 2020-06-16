"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" cscope map
Plug 'xinghun/cscope_maps'

" color schemes
Plug 'flazz/vim-colorschemes'

Plug 'dense-analysis/ale'

Plug 'Yggdroot/LeaderF'

Plug 'preservim/nerdtree'

" Plug 'ycm-core/YouCompleteMe'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim colorschemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme wombat256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep the sign gutter open at all times
" let g:ale_sign_column_always = 1

" Specify what text should be used for signs
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

" Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0

let g:ale_linters = {
\   'c': ['cppcheck', 'gcc'],
\   'cpp': ['cppcheck', 'gcc'],
\}

"let g:ale_pattern_options = {
"\   'svr_context': {
"\       'ale_cpp_gcc_options': '-fPIC -D_DEBUG -Wall -g -pipe  -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function  -Wno-write-strings -Wno-deprecated -fstack-protector -DCODM_VERSION_WEST -I external/tsf4g_base/include -I . -I external/protobuf/include -I build/protocol -I build/protocol'
"\   },
"\}

" let g:ale_cpp_clang_options = '-fPIC -D_DEBUG -Wall -g -pipe  -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function  -Wno-write-strings -Wno-deprecated -fstack-protector -DCODM_VERSION_WEST'


let g:ale_cpp_gcc_options = '-fPIC -D_DEBUG -Wall -g -pipe  -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function  -Wno-write-strings -Wno-deprecated -fstack-protector -DCODM_VERSION_WEST  -I . -I incl -I external/protobuf/include/ -I external/openssl/include/ -I external/tsf4g_base/include -I external/${TSF4G_TCONND_DIR}/include/apps -I external/lua-5.3.5/src/ -I protocol -I external/gtest/include/ -I external/jsoncpp/include/ -I common/jcbase/ -I external/sqlite/include/ -I build/protocol -I external/tsf4g_tconnd_west/include/apps -I clib/incl -I common/normal/include -I common -I common/svr_context -I common/generic_service'
let g:ale_c_gcc_options = '-fPIC -D_DEBUG -Wall -g -pipe  -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function  -Wno-write-strings -Wno-deprecated -fstack-protector -DCODM_VERSION_WEST'

" let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 500
" let g:ale_echo_delay = 20
" let g:ale_lint_delay = 500
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" let g:airline#extensions#ale#enabled = 1

" let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
" let g:ale_c_cppcheck_options = '--error-exitcode=1'
" let g:ale_cpp_cppcheck_options = '--error-exitcode=1'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"let g:Lf_ShortcutF = "<leader>ff"
"let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

