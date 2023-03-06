
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

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'ziglang/zig.vim'
        let g:zig_fmt_autosave = 0

        Plug 'airblade/vim-gitgutter'
        let g:gitgutter_terminal_reports_focus = 0
        highlight! link SignColumn LineNr

        Plug 'mg979/vim-visual-multi'
        " FIXME: leaving VM re-enables search highlighting
        let g:VM_default_mappings = 0
        let g:VM_mouse_mappings = 1

        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-obsession'
    call plug#end()
endif

" Newline-column commands
command C80 :set colorcolumn=80
command CC80 :set colorcolumn=80,84,88,92
command C100 :set colorcolumn=100
command CC100 :set colorcolumn=100,104,108,112
command CR :set colorcolumn=

" Exit bindings
cabbrev wq wqa

" Window navigation bindings
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>
nnoremap <c-m> <c-w>r

