
" Miscellaneous settings
set nocompatible
set nomodeline
set ttimeout
set wildmenu
set autoread
set incsearch
set noruler
set secure

set belloff+=esc
set laststatus=1
set ttimeoutlen=50
set formatoptions+=j
set shortmess=filmnxtToOsS
set backspace=indent,eol,start

if !exists('g:loaded_man')
    runtime ftplugin/man.vim
endif

let mapleader = ','
let maplocalleader = ','
filetype plugin indent on

" Shape of cursors
let &t_SI .= "\<Esc>[3 q"
let &t_SR .= "\<Esc>[3 q"
let &t_EI .= "\<Esc>[3 q"

" Scroll and mouse
set nowrap

set mouse=a
set scrolloff=4
set sidescrolloff=4

" Indentations
set smarttab
set expandtab
set autoindent

set tabstop=4
set shiftwidth=4

" Highlighting
syntax on
colorscheme default-dark
set number
set cursorline
set nospell

set signcolumn=yes
set cursorlineopt=number

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
nnoremap <silent> <leader>sp :set spell!<CR>

" Search
set hlsearch
set ignorecase
set smartcase

noh

cabbrev ml g//p
cabbrev mc %s///ng

if has('macunix')
    " FIXME: Mapping <Esc> results in faulty arrow keys on X-terminal-emulator
    nnoremap <silent> <Esc> :nohl<CR><Esc>
endif

" Terminal
command! T :vert term ++close /bin/bash -l
autocmd TerminalOpen * setl nonumber signcolumn=no
tnoremap <Esc> <C-\><C-n>

" Commands: column width
command! -nargs=+ -complete=command Windo
    \ let s:curwin = winnr() |
    \ exec 'noautocmd keepjumps windo <args>' |
    \ exec s:curwin . 'wincmd w'
command! C80 :Windo set colorcolumn=80
command! CC80 :Windo set colorcolumn=80,92
command! C100 :Windo set colorcolumn=100
command! CC100 :Windo set colorcolumn=100,112
command! CR :Windo set colorcolumn=
command! W80 :Windo set textwidth=80
command! W100 :Windo set textwidth=100
command! WR :Windo set textwidth=0

" Bindings: clipboard
noremap Y "*y
nnoremap YY "*yy
noremap <leader>o y'>p']
nnoremap <leader>o yyp

" Bindings: indentations
xnoremap > >gv
xnoremap < <gv

" Bindings: text movement
nnoremap <silent> <leader>j :m .+1<CR>==
nnoremap <silent> <leader>k :m .-2<CR>==
vnoremap <silent> <leader>j :m '>+1<CR>gv=gv
vnoremap <silent> <leader>k :m '<-2<CR>gv=gv

" Bindings: completion menu
" See keyword completion with C-n and C-p
inoremap <C-]> <C-x><C-]>
inoremap <C-f> <C-x><C-f>
inoremap <C-s> <C-x>s

" Bindings: wrap
inoremap <C-q> <C-o>gww

" Bindings: sort
nnoremap <silent> <leader>so vip \| :sort<CR>}
vnoremap <silent> <leader>so :sort<CR>}

" Bindings: ruler
nnoremap <silent> <leader>ru :set ruler!<CR>

" Bindings: 'as' top header
nnoremap <silent> <leader>as [m

" Bindings: folds
vnoremap za <Esc>`<kzfgg`>jzfG`<

" Bindings: tabs
nnoremap <silent> <leader>tn :Texplore<CR>
nnoremap <silent> <leader>tp :wincmd T<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

nnoremap <silent> <leader>t1 :1tabnext<CR>
nnoremap <silent> <leader>t2 :2tabnext<CR>
nnoremap <silent> <leader>t3 :3tabnext<CR>
nnoremap <silent> <leader>t4 :4tabnext<CR>
nnoremap <silent> <leader>t5 :5tabnext<CR>
nnoremap <silent> <leader>t6 :6tabnext<CR>
nnoremap <silent> <leader>t7 :7tabnext<CR>
nnoremap <silent> <leader>t8 :8tabnext<CR>
nnoremap <silent> <leader>t9 :9tabnext<CR>
nnoremap <silent> <leader>t0 :tabnext #<CR>

nnoremap <silent> <leader>t< :-tabmove<CR>
nnoremap <silent> <leader>t> :+tabmove<CR>
nnoremap <silent> <leader>t/ :0tabmove<CR>

" Compiler defaults
autocmd BufWinEnter * if !get(b:, 'cnodefault', 0) |
    \ nnoremap <buffer> <leader>ll :make!<CR>|
    \ nnoremap <buffer> <leader>lk :make! clean<CR>|
    \ endif
autocmd FileType tex,markdown let b:cnodefault = 1

" Motions
nmap dv "_d

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
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir': 'Compilation',
        \ 'out_dir': 'Compilation' }
    let g:vimtex_view_method = 'skim'
    autocmd FileType tex nnoremap <silent> <buffer> <leader>lb <Plug>(vimtex-compile-ss)

    Plug 'makerj/vim-pdf'
    autocmd FileType pdf setl nonumber readonly modifiable

    Plug 'ziglang/zig.vim'
    let g:zig_fmt_autosave = 0

    Plug 'gi1242/vim-tex-autoclose', { 'for': 'tex' }
    autocmd FileType tex inoremap <silent> <buffer> <C-e> <C-o>:call TexACClosePrev('n')<CR>

    Plug 'iamcco/markdown-preview.nvim', {
        \ 'do': { -> mkdp#util#install() },
        \ 'for': ['markdown', 'vim-plug'] }
    let g:mkdp_page_title = '${name}'
    autocmd FileType markdown
        \ nnoremap <silent> <buffer> <leader>ll :MarkdownPreview<CR> |
        \ nnoremap <silent> <buffer> <leader>lk :MarkdownPreviewStop<CR>

    Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_enabled = executable('ctags')
    let g:gutentags_ctags_tagfile = '.git/tags'

    Plug 'vim-scripts/a.vim'
    Plug 'jceb/vim-orgmode'

    " Mark: Git integration
    Plug 'tpope/vim-fugitive'
    autocmd FileType git,fugitive setl nonumber

    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_terminal_reports_focus = 0

    Plug 'vim-scripts/ConflictMotions'
    nnoremap <silent> <leader>x/ :ConflictTake all<CR>

    Plug 'k0kubun/vim-open-github'

    " Mark: window management
    Plug 'romainl/vim-qf'
    let g:qf_mapping_ack_style = 1
    let g:qf_auto_resize = 0
    nnoremap <leader>q <Plug>(qf_qf_toggle)
    nnoremap <leader>w <Plug>(qf_qf_switch)
    autocmd FileType qf
        \ nnoremap <buffer> { <Plug>(qf_previous_file) |
        \ nnoremap <buffer> } <Plug>(qf_next_file) |
        \ setl wrap

    Plug 'taylor/vim-zoomwin'
    nnoremap <silent> <C-q> :ZoomWin<CR>

    Plug 'skywind3000/vim-preview'
    cabbrev D PreviewFile
    cabbrev DD PreviewClose
    " NOTE: for me, these characters is the key besides the numerical row
    noremap <silent> ± :PreviewScroll -1<CR>
    noremap <silent> § :PreviewScroll +1<CR>

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

    Plug 'QSmally/Text-Center'
    vnoremap C :CenterText<CR>

    Plug 'tpope/vim-commentary'
    autocmd FileType c,cpp,cs setl commentstring=//%s
    autocmd FileType sql setl commentstring=--%s

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
    noremap gb <Plug>YankCode

    Plug 'junegunn/vim-after-object'
    autocmd VimEnter * silent! call after_object#enable(['a'], '=', ':')

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
    Plug 'nishigori/increment-activator'
    Plug 'triglav/vim-visual-increment'
    Plug 'reedes/vim-textobj-sentence', { 'for': ['org', 'tex', 'markdown', 'quarto', 'pdf'] }
    Plug 'vesion/vim-textobj-restline'
    Plug 'vim-scripts/RepeatableYank'
    Plug 'tommcdo/vim-nowchangethat'
    Plug 'arthurxavierx/vim-caser'
    Plug 'andrewradev/dsf.vim'
    Plug 'tpope/vim-surround'
    Plug 'wellle/targets.vim'
    Plug 'machakann/vim-swap'
    Plug 'glts/vim-radical'
    Plug 'tpope/vim-repeat'

    " Mark: modes
    Plug 'genezharov/vim-scrollmode'
    let g:scrollmode_distance = 15
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
    Plug 'tyru/nextfile.vim'
    let g:nf_include_dotfiles = 1
    let g:nf_map_previous = '<leader>f['
    let g:nf_ignore_ext = ['swp']
    let g:nf_map_next = '<leader>f]'

    Plug 'olical/vim-expand'
    nnoremap <silent> <leader>ex :Expand<CR>
    vnoremap <silent> <leader>ex :Expand<CR>

    Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_match_window = 'bottom,order:btt,min:15,max:15,results:15'
    let g:ctrlp_by_filename = 1
    let g:ctrlp_show_hidden = 1
    nnoremap <silent> <C-d> :CtrlPCurWD<CR>
    cabbrev MRU CtrlPMRUFiles
    cabbrev Tags CtrlPTag
    cabbrev Qf CtrlPQuickfix

    if executable('fd')
        let g:ctrlp_user_command = 'fd %s -pLH -d 4 -t file'
    endif

    Plug 'junegunn/vim-slash'
    noremap <Plug>(slash-after) zz

    Plug 'mopp/autodirmake.vim'
    let g:autodirmake#is_confirm = 0

    Plug 'davidgamba/vim-vmath'
    vnoremap <expr> <leader>su VMATH_YankAndAnalyse()

    Plug 'diepm/vim-rest-console', { 'for': 'rest' }
    " FIXME: Buffer not managed by DWM due to missing 'buftype'
    let g:vrc_output_buffer_name = 'rest-response'
    let g:vrc_trigger = '<leader>tr'

    Plug 'jbarberu/vim-diffsaved'
    nnoremap <silent> <leader>fd :DiffSaved<CR>

    Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    Plug 'vim-scripts/loremipsum'
    cabbrev L Loremipsum

    Plug 'andrewradev/linediff.vim'
    let g:linediff_sign_highlight_group = 'Directory'
    nnoremap <silent> <leader>d :Linediff<CR>
    vnoremap <silent> <leader>d :Linediff<CR>
    nnoremap <silent> <leader>ad :LinediffAdd<CR>
    vnoremap <silent> <leader>ad :LinediffAdd<CR>
    nnoremap <silent> <leader>rd :LinediffReset<CR>
    nnoremap <silent> <leader>sd :LinediffShow<CR>

    Plug 'skanehira/docker-compose.vim'
    nnoremap <leader>cu :DockerComposeUp<CR>
    nnoremap <leader>cd :DockerComposeDown<CR>
    nnoremap <leader>cb :DockerComposeBuild<CR>
    nnoremap <leader>cl :DockerComposeList<CR>

    Plug 'thirtythreeforty/lessspace.vim'
    let g:lessspace_normal = 0

    Plug 'kristijanhusak/vim-create-pr'
    Plug 'kshenoy/vim-signature'
    Plug 'antoyo/vim-licenses'
    Plug 'gioele/vim-autoswap'
    Plug 'fcpg/vim-altscreen'
    Plug 'tpope/vim-eunuch'
    Plug 'reedes/vim-wordy', { 'for': ['org', 'tex', 'markdown', 'quarto'] }

    call plug#end()
endif

" Netrw/file browser
let g:netrw_use_errorwindow = 0
let g:netrw_sort_options = 'i'
let g:netrw_browse_split = 0
let g:netrw_sizestyle = 'H'
let g:netrw_liststyle = 1
let g:netrw_list_hide = '.*\.swp,^\.git\/,^\.DS_Store'
let g:netrw_timefmt = '  %a %d %b %Y, %T'
let g:netrw_banner = 0
let g:netrw_hide = 1

autocmd FileType netrw nnoremap <buffer> mp <nop>
autocmd FileType netrw nmap <buffer> <Space> mfj
autocmd FileType netrw setl cursorlineopt=screenline
cabbrev wq wqa
cabbrev S sp

if isdirectory(expand('~/.vim/plugged/DWM'))
    command! E Vexplore | call dwm#layout()
    command! EE vsplit . | call dwm#layout()
    command! F Explore | call dwm#focus_window(0, 1)
    command! FF edit . | call dwm#focus_window(0, 1)
    cabbrev wr wq \| call dwm#layout()
    nnoremap <silent> <leader>fix :call dwm#layout()<CR>
else
    cabbrev E Vexplore
    cabbrev EE vsplit .
    cabbrev F Explore
    cabbrev FF edit .
    cabbrev wr wq
endif

" Tags/dynamic directory iteration
nnoremap <silent> <leader>[ :prev<CR>
nnoremap <silent> <leader>] :next<CR>
nnoremap <silent> <C-\> <C-w>]

if isdirectory(expand('~/.vim/plugged/nextfile.vim'))
    nnoremap <silent> <leader>[ :exec argc() > 1 ? ':prev' : 'norm <leader>f['<CR>
    nnoremap <silent> <leader>] :exec argc() > 1 ? ':next' : 'norm <leader>f]'<CR>
endif
