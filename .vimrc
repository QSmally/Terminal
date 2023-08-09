
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
set nowrap

set mouse=a
set scrolloff=4
set sidescrolloff=12

" Tabs
set smarttab
set expandtab
set autoindent

set tabstop=4
set shiftwidth=4

" Highlighting
syntax on
set number
set cursorline

set signcolumn=yes
set cursorlineopt=number

highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white cterm=bold
highlight! link SignColumn LineNr
highlight! link FoldColumn LineNr
highlight! link TabLineFill LineNr
highlight! link TabLine LineNr
highlight ColorColumn ctermbg=235
highlight Folded ctermfg=white ctermbg=233
highlight QuickFixLine cterm=bold

highlight VertSplit ctermfg=240 ctermbg=234 cterm=none
highlight StatusLine ctermfg=255 ctermbg=234 cterm=bold
highlight StatusLineNC ctermfg=252 ctermbg=234 cterm=none

highlight DiffAdd ctermbg=none
highlight DiffChange ctermbg=none
highlight DiffDelete ctermfg=none ctermbg=none
highlight DiffText cterm=none ctermfg=none ctermbg=242

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
command! C80 :set colorcolumn=80
command! CC80 :set colorcolumn=80,84,88,92
command! C100 :set colorcolumn=100
command! CC100 :set colorcolumn=100,104,108,112
command! CR :set colorcolumn=

" Terminal command and binding
command! T :vert term ++close /bin/bash -l
tnoremap <Esc> <C-\><C-n>

" Command mappings
cabbrev wq wqa

if filereadable(expand('~/.vim/plugged/DWM/plugin/dwm.vim'))
    cabbrev wr wq \| call dwm#layout()
else
    cabbrev wr wq
endif

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

" Tab bindings
nnoremap <silent> <leader>t] :tabnext<CR>
nnoremap <silent> <leader>t[ :tabprev<CR>
nnoremap <silent> <leader>tn :tabnew \| :edit .<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

" Plugins
if filereadable(expand('~/.vim/autoload/plug.vim'))
    call plug#begin()

    " Mark: dependencies
    Plug 'inkarkat/vim-ingo-library'
    Plug 'inkarkat/vim-countjump'
    Plug 'kana/vim-textobj-user'
    Plug 'tpope/vim-speeddating'
    Plug 'glts/vim-magnum'

    " Mark: language integration
    Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:vimtex_compiler_latexmk = { 'build_dir': 'Compilation' }
    let g:vimtex_view_method = 'skim'
    autocmd FileType tex nnoremap <silent> <buffer> <leader>l; <Plug>(vimtex-compile-ss)

    Plug 'makerj/vim-pdf'
    autocmd BufEnter *.pdf setl nonumber

    Plug 'ziglang/zig.vim'
    let g:zig_fmt_autosave = 0

    Plug 'gi1242/vim-tex-autoclose', { 'for': 'tex' }
    autocmd FileType tex nnoremap <silent> <buffer> <leader>c :call TexACClosePrev('n')<CR>

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

    Plug 'tpope/vim-fugitive'
    autocmd FileType git,fugitive setl nonumber

    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_terminal_reports_focus = 0

    Plug 'zivyangll/git-blame.vim'
    nnoremap <silent> <leader>b :call gitblame#echo()<CR>

    Plug 'vim-scripts/ConflictMotions'
    nnoremap <silent> <leader>x/ :ConflictTake all<CR>

    Plug 'k0kubun/vim-open-github'

    " Mark: window management
    Plug 'romainl/vim-qf'
    let g:qf_auto_resize = 0
    nnoremap <leader>q <Plug>(qf_qf_toggle)
    nnoremap <leader>w <Plug>(qf_qf_switch)
    autocmd FileType qf
        \ nnoremap <buffer> { <Plug>(qf_previous_file) |
        \ nnoremap <buffer> } <Plug>(qf_next_file)

    Plug 'taylor/vim-zoomwin'
    nnoremap <silent> <C-q> :ZoomWin<CR>

    Plug 'skywind3000/vim-preview'
    cabbrev D PreviewFile
    cabbrev DD PreviewClose \| call dwm#layout()
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
    let g:VM_default_mappings = 0
    let g:VM_mouse_mappings = 1
    let g:VM_maps = {
        \ 'Find Under': '<C-s>',
        \ 'Find Subword Under': '<C-s>',
        \ 'Add Cursor Down': '<leader>J',
        \ 'Add Cursor Up': '<leader>K' }
    noremap Q gq
    sunmap Q

    Plug 'andrewradev/deleft.vim'
    let g:deleft_remove_strategy = 'spaces'

    Plug 'junegunn/vim-easy-align'
    xnoremap \ <Plug>(EasyAlign)
    nnoremap \ <Plug>(EasyAlign)
    cabbrev Tab EasyAlign

    Plug 'AaronLasseigne/yank-code'
    noremap gy <Plug>YankCode

    Plug 'junegunn/vim-after-object'
    if exists('after_object#enable')
        autocmd VimEnter * call after_object#enable(['a'], '=', ':')
    endif

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
    Plug 'beloglazov/vim-textobj-punctuation'
    Plug 'thalesmello/vim-textobj-methodcall'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'triglav/vim-visual-increment'
    Plug 'reedes/vim-textobj-sentence', { 'for': ['org', 'tex', 'markdown'] }
    Plug 'vesion/vim-textobj-restline'
    Plug 'tommcdo/vim-nowchangethat'
    Plug 'arthurxavierx/vim-caser'
    Plug 'tpope/vim-commentary'
    Plug 'andrewradev/dsf.vim'
    Plug 'tpope/vim-surround'
    Plug 'wellle/targets.vim'
    Plug 'machakann/vim-swap'
    Plug 'glts/vim-radical'

    " Mark: modes
    Plug 'genezharov/vim-scrollmode'
    let g:scrollmode_distance = 10
    let g:scrollmode_mappings = {
        \ ':-5<CR>': ['K', '<S-Up>'],
        \ ':+5<CR>': ['J', '<S-Down>'] }
    let g:scrollmode_actions = {
        \ 'pageup': ['l'],
        \ 'pagedown': ['h'],
        \ 'exit': ['<Esc>'],
        \ 'bdelete': [] }
    nnoremap <silent> <leader>sm <Plug>ScrollMode
    nnoremap <silent> ; <Plug>ScrollMode

    Plug 'dhruvasagar/vim-table-mode'
    let g:table_mode_c = '|'

    " Mark: miscellaneous tools
    Plug 'yegappan/mru'
    let MRU_File = expand('~/.cache/mru')

    Plug 'tyru/nextfile.vim'
    let g:nf_include_dotfiles = 1
    let g:nf_map_previous = '<leader>['
    let g:nf_ignore_ext = ['swp']
    let g:nf_map_next = '<leader>]'

    Plug 'olical/vim-expand'
    nnoremap <silent> <leader>e :Expand<CR>
    vnoremap <silent> <leader>e :Expand<CR>

    Plug 'junegunn/vim-slash'
    noremap <Plug>(slash-after) zz

    Plug 'townk/vim-autoclose'
    let g:AutoClosePairs_del = '`'

    Plug 'mopp/autodirmake.vim'
    let g:autodirmake#is_confirm = 0

    Plug 'davidgamba/vim-vmath'
    vnoremap <expr> <leader>su VMATH_YankAndAnalyse()

    Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    Plug 'vim-scripts/loremipsum'
    cabbrev L Loremipsum

    Plug 'andrewradev/linediff.vim'
    let g:linediff_sign_highlight_group = 'Directory'
    nnoremap <silent> <leader>d :Linediff<CR>
    vnoremap <silent> <leader>d :Linediff<CR>

    Plug 'kevinhui/vim-docker-tools'
    cabbrev Docker DockerToolsToggle

    Plug 'thirtythreeforty/lessspace.vim'
    let g:lessspace_normal = 0

    Plug 'kristijanhusak/vim-create-pr'
    Plug 'kshenoy/vim-signature'
    Plug 'antoyo/vim-licenses'
    Plug 'gioele/vim-autoswap'
    Plug 'fcpg/vim-altscreen'
    Plug 'tpope/vim-dadbod'
    Plug 'tpope/vim-eunuch'
    Plug 'reedes/vim-wordy'

    call plug#end()
endif

" Netrw/file browser
let g:netrw_use_errorwindow = 0
let g:netrw_list_hide= '.*\.swp$,^\.git\/,^\.DS_Store$'
let g:netrw_banner = 0
let g:netrw_hide = 1

if filereadable(expand('~/.vim/plugged/DWM/plugin/dwm.vim'))
    cabbrev E vsplit . \| call dwm#layout()
    cabbrev F edit . \| call dwm#focus_window(0, 1)
else
    cabbrev E vsplit .
    cabbrev F edit .
endif
