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

" gtags.vim
Plug 'xinghun/gtags.vim'

" color schemes
Plug 'flazz/vim-colorschemes'

" Plug 'dense-analysis/ale'

Plug 'Yggdroot/LeaderF'

Plug 'preservim/nerdtree'

" Plug 'joshdick/onedark.vim'

Plug 'ryanoasis/vim-devicons'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'octol/vim-cpp-enhanced-highlight'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install', 'for': ['c', 'cpp', 'lua', 'vim' ]}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>f"
"let g:Lf_ShortcutB = '<m-n>'
noremap <leader>r :LeaderfMru<cr>
noremap <leader>m :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <F3> :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0


"let g:ycm_auto_trigger = 1

" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = '/data/home/wallenwang/toolchains/llvm-10.0.0/bin/clangd'

"let g:ycm_always_populate_location_list = 1

" When set, this option turns on YCM's diagnostic display features.
let g:ycm_show_diagnostics_ui = 0


let g:ycm_auto_hover = ''
nmap <leader>d <plug>(YCMHover)

noremap gd :YcmCompleter GoToDefinition<cr>
noremap gf :YcmCompleter GoToDeclaration<cr>
noremap gr :YcmCompleter GoToReferences<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gtags.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set guifont=Sauce\ Code\ Pro:h12


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
"set updatetime=100
"let g:signify_sign_add               = '+'
"let g:signify_sign_delete            = '_'
"let g:signify_sign_delete_first_line = '‾'
"let g:signify_sign_change            = '!'
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

