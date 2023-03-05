
" Scrolling
set mouse=a
set scrolloff=4

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Break-columns
command C80 :set colorcolumn=80
command CC80 :set colorcolumn=80,84,88,92
command C100 :set colorcolumn=100
command CC100 :set colorcolumn=100,104,108,112
command CR :set colorcolumn=

" Syntax highlighting
syntax on
set number
set cursorline
set cursorlineopt=number

highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white cterm=bold

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'ziglang/zig.vim'
        let g:zig_fmt_autosave = 0

        Plug 'airblade/vim-gitgutter'
        let g:gitgutter_terminal_reports_focus=0
        highlight! link SignColumn LineNr

        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-obsession'
    call plug#end()
endif
