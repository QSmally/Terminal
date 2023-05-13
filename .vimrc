
" Miscellaneous settings
set nocompatible
set nomodeline
set ttimeout
set wildmenu
set autoread
set incsearch

set belloff+=esc
set laststatus=1
set ttimeoutlen=50
set shortmess=filnxtToO
set backspace=indent,eol,start

let mapleader = ','
let maplocalleader = ','
filetype plugin indent on

" Scrolling
set mouse=a
set scrolloff=4

" Tabs
set smarttab
set expandtab
set autoindent

set tabstop=4
set shiftwidth=4

" Syntax highlighting
syntax on
set number
set cursorline
set cursorlineopt=number

highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white cterm=bold
highlight! link SignColumn LineNr
highlight ColorColumn ctermbg=235 guibg=#2c2d27

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Search
set hlsearch
set ignorecase
set smartcase

nnoremap <silent> m :noh<CR>
highlight CurSearch ctermfg=black ctermbg=white

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()

    " Mark: language integration
    Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:vimtex_compiler_latexmk = { 'build_dir': 'Compilation' }
    let g:vimtex_view_method = 'skim'
    autocmd FileType tex nnoremap <silent> <buffer> <leader>l; <Plug>(vimtex-compile-ss)

    Plug 'ziglang/zig.vim'
    let g:zig_fmt_autosave = 0

    Plug 'sotte/presenting.vim'
    cabbrev P PresentingStart

    Plug 'keith/investigate.vim'
    " FIXME: change default search engine for some filetypes
    nnoremap <leader>; :call investigate#Investigate('n')<CR>
    vnoremap <leader>; :call investigate#Investigate('v')<CR>

    Plug 'iamcco/markdown-preview.nvim', {
        \ 'do': { -> mkdp#util#install() },
        \ 'for': ['markdown', 'vim-plug'] }
    let g:mkdp_page_title = '${name}'
    autocmd FileType markdown
        \ nnoremap <silent> <buffer> <leader>ll :MarkdownPreview<CR> |
        \ nnoremap <silent> <buffer> <leader>lk :MarkdownPreviewStop<CR>

    Plug 'tpope/vim-speeddating'
    Plug 'vim-scripts/a.vim'
    Plug 'jceb/vim-orgmode'

    " Mark: Git integration
    Plug 'cohama/agit.vim'
    cabbrev R Agit
    cabbrev C AgitFile

    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_terminal_reports_focus = 0
    set signcolumn=yes

    Plug 'zivyangll/git-blame.vim'
    nnoremap <silent> <leader>b :call gitblame#echo()<CR>

    Plug 'rhysd/conflict-marker.vim'
    let g:conflict_marker_enable_mappings = 0
    nnoremap <silent> <leader>ct :ConflictMarkerThemselves<CR>
    nnoremap <silent> <leader>co :ConflictMarkerOurselves<CR>
    nnoremap <silent> <leader>cb :ConflictMarkerBoth<CR>

    Plug 'tpope/vim-fugitive'

    " Mark: window management
    Plug 'romainl/vim-qf'
    let g:qf_auto_resize = 0
    nnoremap <leader>q <Plug>(qf_qf_toggle)
    nnoremap <leader>w <Plug>(qf_qf_switch)

    Plug 'shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_readonly_file_icon = 'R'
    let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']
    cabbrev F VimFiler
    cabbrev E VimFilerExplorer

    Plug 'wesq3/vim-windowswap'
    let g:windowswap_map_keys = 0
    nnoremap <silent> qq :call WindowSwap#EasyWindowSwap()<CR>

    Plug 'wellle/visual-split.vim'
    cabbrev S VSSplit

    Plug 'andrewradev/undoquit.vim'
    cabbrev Q Undoquit

    Plug 'vim-scripts/copypath.vim'
    let g:copypath_copy_to_unnamed_register = 1
    nnoremap <silent> gyf :CopyFileName<CR>
    nnoremap <silent> gyF :CopyPath<CR>

    Plug 'tpope/vim-obsession'
    Plug 'artnez/vim-wipeout'
    Plug 'justinmk/vim-gtfo'
    Plug 'mileszs/ack.vim'
    Plug 'QSmally/DWM'

    " Mark: text objects
    Plug 'godlygeek/tabular'
    cabbrev Tab Tabularize

    Plug 'gcmt/wildfire.vim'
    map <leader>k <Plug>(wildfire-fuel)
    vmap <leader>j <Plug>(wildfire-water)

    Plug 'mg979/vim-visual-multi'
    " FIXME: leaving VM through 'Q' re-enables search highlighting
    let g:VM_default_mappings = 0
    let g:VM_mouse_mappings = 1
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = '<C-m>'
    let g:VM_maps['Find Subword Under'] = '<C-m>'
    map Q gq
    sunmap Q

    Plug 'dhruvasagar/vim-table-mode'
    let g:table_mode_c = '|'

    Plug 'coderifous/textobj-word-column.vim'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'triglav/vim-visual-increment'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'wellle/targets.vim'

    " Mark: miscellaneous tools
    Plug 'vim-scripts/loremipsum'
    cabbrev L Loremipsum

    Plug 'mopp/autodirmake.vim'
    let g:autodirmake#is_confirm = 0

    Plug 'antoyo/vim-licenses'
    Plug 'mtth/scratch.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'Shougo/unite.vim'
    Plug 'yegappan/mru'

    call plug#end()
endif

" Newline-column commands
command C80 :set colorcolumn=80
command CC80 :set colorcolumn=80,84,88,92
command C100 :set colorcolumn=100
command CC100 :set colorcolumn=100,104,108,112
command CR :set colorcolumn=

" Terminal command and binding
command T :vert term ++close /bin/bash -l
tnoremap <Esc> <C-\><C-n>

" Command mappings
cabbrev wq wqa
cabbrev h vert h

" Window navigation bindings
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>
nnoremap <leader>[ :prev<CR>
nnoremap <leader>] :next<CR>

" Clipboard bindings
noremap Y "*y
nnoremap YY "*yy
noremap <leader>o y'>p']
nnoremap <leader>o yyp
nnoremap <leader>p p']

" Indentation bindings
xnoremap > >gv
xnoremap < <gv

