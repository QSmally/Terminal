
let colors_name = 'default-dark'

" Default syntax highlights
if exists('syntax_on')
    syntax reset
endif

highlight clear
set background=dark

" Editor colours
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=white cterm=bold
highlight! link SignColumn LineNr
highlight! link FoldColumn LineNr
highlight! link TabLine LineNr
highlight! link TabLineFill LineNr
highlight ColorColumn ctermbg=235
highlight Folded ctermfg=white ctermbg=233
highlight QuickFixLine cterm=bold

" Window borders
highlight VertSplit ctermfg=240 ctermbg=234 cterm=none
highlight StatusLine ctermfg=255 ctermbg=234 cterm=bold
highlight StatusLineTerm ctermfg=255 ctermbg=234 cterm=bold
highlight StatusLineNC ctermfg=252 ctermbg=234 cterm=none
highlight StatusLineTermNC ctermfg=252 ctermbg=234 cterm=none

" File difference
highlight DiffAdd ctermbg=none
highlight DiffChange ctermbg=none
highlight DiffDelete ctermfg=none ctermbg=none
highlight DiffText cterm=none ctermfg=none ctermbg=242

" Search
highlight Search ctermfg=black
highlight CurSearch ctermfg=black ctermbg=white

" Menu popup
highlight Pmenu ctermfg=248 ctermbg=0
highlight PmenuSel ctermfg=13 ctermbg=0
highlight PmenuKind ctermfg=251 ctermbg=0
highlight PmenuExtra ctermfg=251 ctermbg=0
highlight! link PmenuKindSel PmenuSel
highlight! link PmenuExtraSel PmenuSel
highlight PmenuSbar ctermbg=240
highlight PmenuThumb ctermbg=254
