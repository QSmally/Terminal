
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
set shortmess=filnxtToOsS
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
highlight Folded ctermfg=white ctermbg=235 guibg=#2c2d27

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Search
set hlsearch
set ignorecase
set smartcase

cabbrev ml g//p
cabbrev mc %s///ng
nnoremap <silent> <Esc> :nohl<CR><Esc>
highlight CurSearch ctermfg=black ctermbg=white

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

" Window navigation bindings
nnoremap <tab> <C-w>
nnoremap <tab><tab> <C-w><C-w>
nnoremap <leader>[ :prev<CR>
nnoremap <leader>] :next<CR>

" Clipboard bindings
noremap Y "*y
nnoremap YY "*yy
noremap <leader>o y'>p']
nnoremap <leader>o yyp

" Indentation bindings
xnoremap > >gv
xnoremap < <gv

" Movement bindings
nnoremap <silent> <leader>j :m .+1<CR>==
nnoremap <silent> <leader>k :m .-2<CR>==
vnoremap <silent> <leader>j :m '>+1<CR>gv=gv
vnoremap <silent> <leader>k :m '<-2<CR>gv=gv

" Custom motions
nnoremap <leader>df daBddk

" Plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()

    " Mark: dependencies
    Plug 'inkarkat/vim-ingo-library'
    Plug 'inkarkat/vim-countjump'
    Plug 'kana/vim-textobj-user'
    Plug 'tpope/vim-speeddating'

    " Mark: language integration
    Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:vimtex_compiler_latexmk = { 'build_dir': 'Compilation' }
    let g:vimtex_view_method = 'skim'
    autocmd FileType tex nnoremap <silent> <buffer> <leader>l; <Plug>(vimtex-compile-ss)

    Plug 'ziglang/zig.vim'
    let g:zig_fmt_autosave = 0

    Plug 'gi1242/vim-tex-autoclose', { 'for': 'tex' }
    autocmd FileType tex nnoremap <silent> <buffer> <leader>e :call TexACClosePrev('n')<CR>

    Plug 'iamcco/markdown-preview.nvim', {
        \ 'do': { -> mkdp#util#install() },
        \ 'for': ['markdown', 'vim-plug'] }
    let g:mkdp_page_title = '${name}'
    autocmd FileType markdown
        \ nnoremap <silent> <buffer> <leader>ll :MarkdownPreview<CR> |
        \ nnoremap <silent> <buffer> <leader>lk :MarkdownPreviewStop<CR>

    Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_enabled = filereadable('/usr/bin/ctags')
    let g:gutentags_ctags_tagfile = '.git/tags'

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

    Plug 'vim-scripts/ConflictMotions'
    nnoremap <silent> <leader>x/ :ConflictTake all<CR>

    Plug 'k0kubun/vim-open-github'
    Plug 'tpope/vim-fugitive'

    " Mark: window management
    Plug 'romainl/vim-qf'
    let g:qf_auto_resize = 0
    nnoremap <leader>q <Plug>(qf_qf_toggle)
    nnoremap <leader>w <Plug>(qf_qf_switch)

    Plug 'taylor/vim-zoomwin'
    nnoremap <silent> <C-q> :ZoomWin<CR>

    Plug 'shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_readonly_file_icon = 'R'
    let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']
    " FIXME: file manager remaps C-J even though in use by DWM
    cabbrev F VimFiler
    cabbrev E VimFilerSplit

    Plug 'wellle/visual-split.vim'
    cabbrev S VSSplitBelow

    Plug 'skywind3000/vim-preview'
    cabbrev D PreviewFile
    cabbrev DD PreviewClose
    " NOTE: for me, these characters is the key besides the numerical row
    noremap <silent> ± :PreviewScroll -1<CR>
    noremap <silent> § :PreviewScroll +1<CR>

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
    Plug 'jayflo/vim-skip'
    let g:vimskip_mapforwardskip = 'S'

    Plug 'gcmt/wildfire.vim'
    let g:wildfire_objects = [
        \ 'i''', 'a''', 'i"', 'a"', 'i)', 'a)',
        \ 'i]', 'a]', 'i}', 'a}', 'ip', 'it',
        \ 'at']
    noremap + <Plug>(wildfire-fuel)
    vnoremap _ <Plug>(wildfire-water)
    nnoremap _ V \| <Plug>(wildfire-water)

    Plug 'justinmk/vim-sneak'
    let g:sneak#use_ic_scs = 1
    let g:sneak#prompt = ''
    highlight link Sneak None

    Plug 'mg979/vim-visual-multi'
    " FIXME: leaving VM through 'Q' re-enables search highlighting
    let g:VM_default_mappings = 0
    let g:VM_mouse_mappings = 1
    let g:VM_maps = {
        \ 'Find Under': '<C-s>',
        \ 'Find Subword Under': '<C-s>' }
    noremap Q gq
    sunmap Q

    Plug 'andrewradev/deleft.vim'
    let g:deleft_remove_strategy = 'spaces'

    Plug 'junegunn/vim-easy-align'
    xnoremap m <Plug>(EasyAlign)
    nnoremap m <Plug>(EasyAlign)
    cabbrev Tab EasyAlign

    Plug 'AaronLasseigne/yank-code'
    noremap gy <Plug>YankCode

    Plug 'junegunn/vim-after-object'
    autocmd VimEnter * call after_object#enable(['a'], '=', ':')

    Plug 'haya14busa/vim-edgemotion'
    noremap ) <Plug>(edgemotion-j)
    noremap ( <Plug>(edgemotion-k)

    Plug 'vim-scripts/transpose-words'
    nnoremap g/ <Plug>Transposewords

    Plug 'saaguero/vim-textobj-pastedtext'
    let g:pastedtext_select_key = 'gp'

    Plug 'inkarkat/vim-unconditionalpaste'
    let g:UnconditionalPaste_no_mappings = 1
    nnoremap gcp <Plug>UnconditionalPasteInlinedAfter
    nnoremap gcP <Plug>UnconditionalPasteInlinedBefore
    nnoremap gjp <Plug>UnconditionalPasteCharAfter
    nnoremap gjP <Plug>UnconditionalPasteCharBefore
    nnoremap glp <Plug>UnconditionalPasteLineAfter
    nnoremap glP <Plug>UnconditionalPasteLineBefore

    Plug 'julian/vim-textobj-variable-segment'
    Plug 'coderifous/textobj-word-column.vim'
    Plug 'thalesmello/vim-textobj-methodcall'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'triglav/vim-visual-increment'
    Plug 'reedes/vim-textobj-sentence', { 'for': ['org', 'tex', 'markdown'] }
    Plug 'vesion/vim-textobj-restline'
    Plug 'tommcdo/vim-nowchangethat'
    Plug 'arthurxavierx/vim-caser'
    Plug 'tpope/vim-commentary'
    Plug 'jceb/vim-textobj-uri'
    Plug 'andrewradev/dsf.vim'
    Plug 'tpope/vim-surround'
    Plug 'wellle/targets.vim'
    Plug 'machakann/vim-swap'

    " Mark: modes
    Plug 'genezharov/vim-scrollmode'
    let g:scrollmode_distance = 10
    let g:scrollmode_mappings = {
        \ ':-4<CR>': ['K', '<S-Up>'],
        \ ':+4<CR>': ['J', '<S-Down>'] }
    let g:scrollmode_actions = {
        \ 'pageup': ['l'],
        \ 'pagedown': ['h'],
        \ 'exit': ['<Esc>'],
        \ 'bdelete': [] }
    nnoremap <silent> <leader>sm <Plug>ScrollMode
    nnoremap <silent> ; <Plug>ScrollMode

    Plug 'dhruvasagar/vim-table-mode'
    let g:table_mode_c = '|'

    Plug 'andrewradev/multichange.vim'
    let g:multichange_mapping = '<leader>mm'
    let g:multichange_motion_mapping = 'm'

    " Mark: miscellaneous tools
    Plug 'junegunn/vim-slash'
    noremap <Plug>(slash-after) zz

    Plug 'mopp/autodirmake.vim'
    let g:autodirmake#is_confirm = 0

    Plug 'ferranpm/vim-isolate'
    nnoremap gi vip \| :Isolation<CR>
    vnoremap gi :Isolation<CR>

    Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    Plug 'vim-scripts/loremipsum'
    cabbrev L Loremipsum

    Plug 'kevinhui/vim-docker-tools'
    cabbrev Docker DockerToolsToggle

    Plug 'thirtythreeforty/lessspace.vim'
    let g:lessspace_normal = 0

    Plug 'kristijanhusak/vim-create-pr'
    Plug 'vim-scripts/visSum.vim'
    Plug 'townk/vim-autoclose'
    Plug 'antoyo/vim-licenses'
    Plug 'gioele/vim-autoswap'
    Plug 'fcpg/vim-altscreen'
    Plug 'tpope/vim-eunuch'
    Plug 'Shougo/unite.vim'
    Plug 'reedes/vim-wordy'
    Plug 'yegappan/mru'

    call plug#end()
endif
