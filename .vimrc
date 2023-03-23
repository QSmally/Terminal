
" Scrolling
set mouse=a
set scrolloff=4

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Syntax highlighting
syntax on
set number
set cursorline
set cursorlineopt=number

highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white cterm=bold

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Search
set hlsearch
command CL :noh
highlight CurSearch ctermfg=black ctermbg=white

" Miscellaneous settings
set wildmenu
set autoread
set incsearch
set shortmess=filnxtToO

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'ziglang/zig.vim'
        let g:zig_fmt_autosave = 0

        Plug 'cohama/agit.vim'
        cabbrev R Agit
        cabbrev C AgitFile

        Plug 'sotte/presenting.vim'
        cabbrev P PresentingStart

        Plug 'wesq3/vim-windowswap'
        let g:windowswap_map_keys = 0
        nnoremap <silent> qq :call WindowSwap#EasyWindowSwap()<CR>

        Plug 'keith/investigate.vim'
        " FIXME: change default search engine for some filetypes
        nnoremap K :call investigate#Investigate('n')<CR>
        vnoremap K :call investigate#Investigate('v')<CR>

        Plug 'airblade/vim-gitgutter'
        let g:gitgutter_terminal_reports_focus = 0
        highlight! link SignColumn LineNr

        Plug 'mg979/vim-visual-multi'
        " FIXME: leaving VM re-enables search highlighting
        let g:VM_default_mappings = 0
        let g:VM_mouse_mappings = 1

        Plug 'vim-scripts/loremipsum'
        cabbrev L Loremipsum

        Plug 'wellle/visual-split.vim'
        cabbrev S VSSplit

        Plug 'vim-scripts/copypath.vim'
        let g:copypath_copy_to_unnamed_register = 1
        cabbrev YF CopyFileName
        cabbrev YP CopyPath

        Plug 'andrewradev/undoquit.vim'
        cabbrev Q Undoquit

        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-obsession'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'wellle/targets.vim'
        Plug 'vim-scripts/a.vim'
        Plug 'godlygeek/tabular'
        Plug 'jceb/vim-orgmode'
        Plug 'danro/rename.vim'
        Plug 'lervag/vimtex'
        Plug 'yegappan/mru'
    call plug#end()
endif

" Newline-column commands
command C80 :set colorcolumn=80
command CC80 :set colorcolumn=80,84,88,92
command C100 :set colorcolumn=100
command CC100 :set colorcolumn=100,104,108,112
command CR :set colorcolumn=

" Terminal command
command T :vert term ++close /bin/bash -l

" Command mappings
cabbrev wq wqa
cabbrev h vert h

" Window navigation bindings
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" Clipboard bindings
noremap Y "*y
nnoremap YY "*yy

