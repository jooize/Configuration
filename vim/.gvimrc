" Modeline {{{
"   vim: set foldmarker={{{,}}} expandtab:
" }}}
" Basics {{{
    set columns=120
    if has("gui_win32")
        set guifont=Envy_Code_R:h11,Consolas:h10,Anonymous_Pro:h10,Lucida_Console:h10
    endif
    if has("gui_macvim")
        set guifont=Menlo:h12,Andale_Mono:h12,Monaco:h12
    endif
    set guioptions=ce
    "              ||
    "              |+-- Use simple dialogs rather than pop-ups
    "              +-- Use GUI tabs, not console style tabs
    set lines=26
"   set linespace=0 " GUI: Don't insert any extra pixel lines
" }}}
" General {{{
    set mousehide " Hide the mouse cursor when typing
" }}}
" Mappings {{{
    " Tabs {{{
        noremap <silent> <C-Tab> :tabnext<CR>|
        noremap <silent> <C-S-Tab> :tabprev<CR>|
    " }}}
" }}}

