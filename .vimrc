
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
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white

" TODO: Fix highlight + window enter/leave
" TODO: Highlight current line number

set number

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'ziglang/zig.vim'
        let g:zig_fmt_autosave = 0

        Plug 'airblade/vim-gitgutter'
        let g:gitgutter_terminal_reports_focus=0
        highlight! link SignColumn LineNr
    call plug#end()
endif
