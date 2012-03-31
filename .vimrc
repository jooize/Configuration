" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 expandtab:
"   Original: http://vi-improved.org/vimrc.php
" }
" Basics {
    if has("gui_running") " Necessary here for 256 color theme to load
        set t_Co=256 " Force 256 colors for GUI Vim (e.g. MacVim)
    endif
    set nocompatible " Explicitly get out of vi-compatible mode
    set noexrc " Don't use local version of .(g)vimrc, .exrc
    set background=dark " We plan to use a dark background
    if has('syntax') && (&t_Co > 2)
        syntax on " Syntax highlighting on
    endif
" }
" General {
    filetype plugin indent on " Load filetype plugins/indent settings
    "set autochdir " Always switch to the current file directory
    set backspace=indent,eol,start " Make backspace delete linebreaks
    set backup " Make backup files
    set backupdir=$HOME/.vim/backup " Where to put backup files
    "set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    set clipboard=unnamed " Share OS clipboard
    set directory=$HOME/.vim/temp " Directory to place swap files in
    set fileformats=unix,dos,mac " Support all three, in this order
    "set hidden " You can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$ ",@,%,# " None of these are word dividers
    set modeline " Enable modelines
    set modelines=5 " Amount of lines to scan for modeline (top/bottom)
    set mouse=a " a = Always, i = Insert mode only
    "set whichwrap=b,s,~,[,]
    "set whichwrap=b,s,h,l,<,>,~,[,] " Everything wraps
    "              | | | | | | | | |
    "              | | | | | | | | +-- "]" Insert and Replace
    "              | | | | | | | +-- "[" Insert and Replace
    "              | | | | | | +-- "~" Normal
    "              | | | | | +-- <Right> Normal and Visual
    "              | | | | +-- <Left> Normal and Visual
    "              | | | +-- "l" Normal and Visual (not recommended)
    "              | | +-- "h" Normal and Visual (not recommended)
    "              | +-- <Space> Normal and Visual
    "              +-- <BS> Normal and Visual
    set wildmenu " Turn on command line completion wild style
    " Ignore this list of file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    "set wildmode=list:longest " Turn on wild mode huge list
" }
" Vim UI {
    " Bells off {
    set noerrorbells
    set visualbell
    set t_vb=
    if has('autocmd')
        autocmd GUIEnter * set visualbell t_vb=
    endif
    " }
    " Colorscheme desert {
    if (&t_Co >= 256)
        colorscheme desert256
    else
        colorscheme desert
    endif
    " }
    set cursorline " Highlight current line
    set nohlsearch " Do not highlight searched for phrases
    set incsearch " Highlight *as you type* your search term
    set laststatus=2 " Always show the status line
    set lazyredraw " Do not redraw while running macros
    set list " We do what to show tabs, to ensure we get them
              " out of my files
    set listchars=tab:>-,trail:- " Show tabs and trailing
    set matchtime=1 " How many tenths of a second to blink
                     " matching brackets for
    set number " Turn on line numbers
    set numberwidth=5 " 99999 lines
    set report=0 " Tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=5 " Keep lines (top/bottom) for scope
    set shortmess=aOstT " Shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " Show the command being typed
    set showmatch " Show matching brackets
    set sidescroll=1 " Scroll by 'n' character(s)
    set sidescrolloff=20 " Keep 'n' lines at the size
    set nostartofline " Leave my cursor where it was
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + Current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- Current line
    "              | | | | |  |   |      |  +-- Current % into file
    "              | | | | |  |   |      +-- Current syntax in
    "              | | | | |  |   |           square brackets
    "              | | | | |  |   +-- Current fileformat
    "              | | | | |  +-- Number of lines
    "              | | | | +-- Preview flag in square brackets
    "              | | | +-- Help flag in square brackets
    "              | | +-- Readonly flag in square brackets
    "              | +-- Rodified flag in square brackets
    "              +-- Full path to file in the buffer
    set winminheight=0 " Allow zero height windows
" }
" Text Formatting/Layout {
    "set completeopt= " Don't use a pop up menu for completions
"    set expandtab " Create no real tabs
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " Case insensitive by default
    set infercase " Case inferred by default
    set nowrap " Wrap lines
    set shiftround " When at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " If there are caps, go case-sensitive
    set shiftwidth=4 " Auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " When hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=4 " Width of real tabs
" }
" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                       " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " What movements
                                                      " open folds
    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                   " (cleaner than default)
" }
" Plugin Settings {
    let b:match_ignorecase = 1 " Case is stupid
    let perl_extended_vars = 1 " Highlight advanced perl vars
                                " inside strings

    " TagList settings {
        let Tlist_Auto_Open = 0 " Let the tag list open automagically
        let Tlist_Compact_Format = 1 " Show small menu
        let Tlist_Ctags_Cmd = 'ctags' " Location of ctags
        let Tlist_Enable_Fold_Column = 0 " Do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " If you are the last, kill
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " Fold closed other trees
        let Tlist_Sort_Type = "name" " Order by
        let Tlist_Use_Right_Window = 1 " Split to the right side
                                        " of the screen
        let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                 " read my functions
        " Language specifics {
            " Just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " Just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " Don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " Just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
    " }
" }
" Mappings {
    " Map Escape to Tab {
        " The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
        " To minimize Tab use, you can use '<', '>' and ':set autoindent'
" Set in colemak.vim
"        nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
"        vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
"        inoremap <Tab> <Esc>|
"        nnoremap <S-Tab> i<Tab><Esc><Right>
"        vnoremap <S-Tab> >gv|
"        inoremap <S-Tab> <Tab>|
    " }
    " Map b to buffer list {
        nnoremap b :buffers<Enter>:buffer<Space>
    " }
" }
" Autocommands {
    " Ruby {
        " Ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
"        au BufRead,BufNewFile *.notes set foldlevel=2
"        au BufRead,BufNewFile *.notes set foldmethod=indent
"        au BufRead,BufNewFile *.notes set foldtext=foldtext()
"        au BufRead,BufNewFile *.notes set listchars=tab:\ \
"        au BufRead,BufNewFile *.notes set noexpandtab
"        au BufRead,BufNewFile *.notes set shiftwidth=8
"        au BufRead,BufNewFile *.notes set softtabstop=8
"        au BufRead,BufNewFile *.notes set tabstop=8
"        au BufRead,BufNewFile *.notes set syntax=notes
"        au BufRead,BufNewFile *.notes set nocursorcolumn
"        au BufRead,BufNewFile *.notes set nocursorline
"        au BufRead,BufNewFile *.notes set spell
    " }
" }
" GUI Settings {
if has("gui_running")
    " Basics {
        set columns=120
        set guifont=Terminus:h12
        set guioptions=ce
        "              ||
        "              |+-- Use simple dialogs rather than pop-ups
        "              +-- Use GUI tabs, not console style tabs
        set lines=26
        set linespace=0 " GUI: Don't insert any extra pixel lines
    " }
    " General {
        " set autochdir " This might not be necessary
        set mousehide " Hide the mouse cursor when typing
    " }
    " Style {
        hi clear CursorLine
        hi CursorLine gui=underline guisp=yellow
    " }
endif
" }
" Plugins {
    source $HOME/.vim/plugin/colemak.vim
" }
