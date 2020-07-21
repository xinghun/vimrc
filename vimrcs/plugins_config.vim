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

Plug 'xinghun/cscope_maps'

Plug 'xinghun/gtags.vim'

" An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc.
Plug 'Yggdroot/LeaderF'

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'jeaye/color_coded'
"Plug 'bfrg/vim-cpp-modern'

" Comment functions so powerful—no comment necessary.
Plug 'preservim/nerdcommenter'

" colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'xinghun/mymrkn256'

"Plug 'prabirshrestha/vim-lsp'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ },
      \ 'colorscheme': 'default'
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
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
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_WildIgnore = {
     \ 'dir': ['.svn', '.git', '.hg', '.vscode', '.clangd'],
     \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
     \}

let g:Lf_ShortcutF = "<leader>f"
let g:Lf_ShortcutB = "<leader>b"
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
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
"set updatetime=100
let g:signify_sign_add               = '洛'
let g:signify_sign_delete            = '﫧'
let g:signify_sign_delete_first_line = ''
let g:signify_sign_change            = ''


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Register ccls C++ lanuage server.
"if executable('ccls')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
"      \ 'whitelist': ['c', 'cpp', 'cc'],
"      \ 'semantic_highlight': {
"      \   'entity.name.function.cpp': 'ErrorMsg',
"      \   'entity.name.function.method.cpp': 'ErrorMsg',
"      \   'entity.name.type.class.cpp': 'ErrorMsg',
"      \ }
"      \ })
"endif

"if executable('clangd')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'clangd',
"      \ 'cmd': {server_info->['clangd']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'whitelist': ['c', 'cpp', 'cc'],
"      \ 'semantic_highlight': {
"      \   'entity.name.function.cpp': 'Function',
"      \   'entity.name.function.method.cpp': 'Function',
"      \   'entity.name.function.method.static.cpp': 'Function',
"      \   'entity.name.namespace.cpp': 'Label',
"      \   'entity.name.type.class.cpp': 'Label',
"      \   'entity.name.type.enum.cpp': 'Label',
"      \   'variable.other.cpp': 'rubySymbol',
"      \   'variable.other.enummember.cpp': 'rubySymbol',
"      \   'variable.other.field.cpp': 'rubySymbol',
"      \   'variable.other.field.static.cpp': 'rubySymbol',
"      \   'variable.other.local.cpp': 'rubySymbol',
"      \   'variable.parameter.cpp': 'rubySymbol',
"      \ }
"      \ })
"endif



" disable diagnostics support
"let g:lsp_diagnostics_enabled = 0
"let g:lsp_highlight_references_enabled = 1

" enable semantic highlighting
"let g:lsp_semantic_enabled = 1

" Key bindings for vim-lsp.
"nmap <silent> md :LspDefinition<cr>
"nmap <silent> mr :LspReferences<cr>
"nmap <silent> ma :LspWorkspaceSymbol<cr>
"nmap <silent> ml :LspDocumentSymbol<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


"let g:cpp_class_scope_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_member_variable_highlight = 1

