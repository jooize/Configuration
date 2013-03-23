" Modeline {{{
"   vim: set foldmarker={{{,}}} expandtab:
" }}}
" Vundle {{{
    source $HOME/.vim/bundles.vim
" }}}
" Basics {{{
    set nocompatible " Explicitly get out of Vi compatible mode
    set noexrc " What does this do exactly?
    if has('syntax') && (&t_Co > 2)
        syntax on " Syntax highlighting on
    endif
    filetype plugin indent on " Load filetype plugins/indent settings
" }}}
" General {{{
    "set autochdir " Always switch to the current file directory
    "set autoread " Don't enable, use WatchForChanges() -- http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
    "set autowriteall " Recommended to enable on demand
    set backspace=indent,eol,start " Make backspace delete linebreaks
    "set clipboard=unnamed " Share OS X clipboard
    set fileformats=unix,dos,mac " Support all three, in this order
    set hidden " You can switch buffers without saving
    let mapleader = ","
    let maplocalleader = ";"
    set modeline " Enable modelines
    set modelines=5 " Amount of lines to scan for modeline (top/bottom)
    set mouse=a " a = Always, i = Insert mode, c = Command line
    set ttymouse=xterm2 " Make mouse drag work in Tmux
    " Time out on key codes but not mappings. Basically this makes terminal Vim work sanely
        set notimeout
        set ttimeout
        set ttimeoutlen=10

    " Wildmenu completion {{{
        set wildmenu

        set wildignore+=.git,.hg,.svn                    " Version control
        set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
        set wildignore+=*.spl                            " Compiled spelling word lists
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.DS_Store                       " OS X

        set wildignore+=*.luac                           " Lua byte code

        set wildignore+=migrations                       " Django migrations
        set wildignore+=*.pyc                            " Python byte code

        set wildignore+=*.orig                           " Merge resolution files

        set wildignore+=classes
        set wildignore+=lib
    " }}}
" }}}
" Backup/Swap/Undo {{{
    set backupdir=$HOME/.vim/tmp/backup//
    set directory=$HOME/.vim/tmp/swap//
    set undodir=$HOME/.vim/tmp/undo//
    set backup
    set swapfile
    set undofile
    set undoreload=10000
" }}}
" Vim UI {{{
    " Bells
        set noerrorbells
        set visualbell
        set t_vb=

    set background=dark

    " Colorscheme
    if (&t_Co >= 256)
        "colorscheme desert256

        colorscheme badwolf

        let g:solarized_visibility = 'low'
        "colorscheme solarized
    elseif (&t_Co >= 8)
        colorscheme desert
    endif

    "set colorcolumn=+1
    set cursorline " Highlight current line
    " Folding
        set foldenable " Turn on folding
        set foldmethod=marker " Fold on the marker
        set foldlevel=1 " Don't autofold anything (but I can still fold manually)
        set foldopen=block,hor,mark,percent,quickfix,tag " What movements open folds
        function! MyFoldText() " {{{
            let line = getline(v:foldstart)

            let nucolwidth = &fdc + &number * &numberwidth
            let windowwidth = winwidth(0) - nucolwidth - 3
            let foldedlinecount = v:foldend - v:foldstart

            " Expand tabs into spaces
            let onetab = strpart('          ', 0, &tabstop)
            let line = substitute(line, '\t', onetab, 'g')

            let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
            let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
            return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
        endfunction " }}}
        set foldtext=MyFoldText()

    set hlsearch " Highlight search phrase
    set incsearch " Highlight *as you type* your search term
    set laststatus=2 " Always show the status line
    set lazyredraw " Do not redraw while running macros
    set list " Show special characters
    if has("multi_byte_encoding")
        set fillchars=diff:⣿,vert:│
        "set listchars=tab:▸\ ,trail:⌴,eol:¬,extends:❯,precedes:❮ " Works in OS X
        set listchars=tab:»·,trail:·,extends:>,precedes:< " Works in Windows and OS X
        set showbreak=↪
    endif
    set matchtime=1 " How many tenths of a second to blink matching brackets for
    set nonumber " Line numbers
    set norelativenumber " Line numbers relative to current line
    set numberwidth=2
    set report=0 " Tell us when anything is changed via :...
    set ruler " Show current positions along the bottom
    set scrolloff=5 " Keep lines (top/bottom) for scope
    set shortmess=aOstT " Shorten messages to avoid 'press a key' prompt
    set showcmd " Show the command being typed
    set showmatch " Show matching brackets
    set sidescroll=1 " Scroll by 'n' character(s)
    set sidescrolloff=20 " Keep 'n' lines at the size
    set splitbelow " Put the new window below when splitting
    set splitright
    set nostartofline " Leave my cursor where it was
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + Current column
    "              | | | | |  |   |      |  |     +-- Current line
    "              | | | | |  |   |      |  +-- Current % into file
    "              | | | | |  |   |      +-- Current syntax in square brackets
    "              | | | | |  |   +-- Current fileformat
    "              | | | | |  +-- Number of lines
    "              | | | | +-- Preview flag in square brackets
    "              | | | +-- Help flag in square brackets
    "              | | +-- Readonly flag in square brackets
    "              | +-- Rodified flag in square brackets
    "              +-- Full path to file in the buffer
    set synmaxcol=3000 " Stop highlighting lines beyond this length
    set winminheight=0 " Allow zero height windows
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers
" }}}
" Text Formatting/Layout {{{
    "set expandtab " Create no real tabs
    set formatoptions-=tc
    set formatoptions+=rnq " May be overridden by filetype plugins
    set gdefault " Default to global regex
    set ignorecase
    set noinfercase
    set nowrap " Wrap lines
    set shiftround " When at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " If there are capital letters, go case-sensitive
    set shiftwidth=4 " Auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " When hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4 " Width of real tabs
    set textwidth=80
" }}}
" Mappings {{{
    " Enable Shift-Tab {{{
        execute 'set t_kB=' . nr2char(27) . '[Z'
    " }}}
    " j/k always jumps one visual line {{{
        nnoremap j gj
        nnoremap k gk
    " }}}
    " Faster scrolling with <C-y>/<C-e> {{{
        nnoremap <C-y> 3<C-y>
        nnoremap <C-e> 3<C-e>
    " }}}
    " Search options: regular regexes {{{
        nnoremap / /\v
        vnoremap / /\v
    " }}}
    " Visual mode pressing * or # searches for the current selection {{{
        vnoremap <silent> * :call VisualSelection('next')<CR>
        vnoremap <silent> # :call VisualSelection('previous')<CR>
    " }}}
    " Replace selection (doesn't handle multiple lines) {{{
        vnoremap <silent> <Leader>r :call VisualSelection('replace')<CR>
    " }}}
    " Allow . to execute once for each line of a visual selection {{{
        vnoremap . :normal .<CR>
    " }}}
    " Show buffers and let me pick {{{
        nnoremap <Leader>b :ls<CR>:buffer<Space>
    " }}}
    " Delete/Backspace {{{
        nnoremap <C-w> i<C-w><Esc>
        nnoremap <C-d> "_dw|vnoremap <C-d> "_d|inoremap <C-d> <Delete>|cnoremap <C-d> <Delete>|
        nnoremap <Delete> "_x|vnoremap <Delete> "_d|
        nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|
    " }}}
    " Break undo chain (Tip #1054) {{{
        inoremap <CR> <C-g>u<CR>|
    " }}}
    " Insert Space {{{
        nnoremap <Space> i<Space><Esc><Right>|
        xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
        xnoremap <silent> <S-Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv<<CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
    " }}}
    " Page up/down {{{
        nnoremap <silent> <expr> <C-b> (winheight(0)-1) . "\<C-u>"
        nnoremap <silent> <expr> <C-f> (winheight(0)-1) . "\<C-d>"
    " }}}
    " Clear search highlighting {{{
        nnoremap <silent> <Leader><Leader> :set invhlsearch<CR>
    " }}}
    " Strip trailing whitespace in whole file {{{
        nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
    " }}}
    " Cursor position jumplist {{{
        nnoremap ( <C-o>|
        nnoremap ) <C-i>|
    " }}}
    " Center {{{
        " Use :suspend for suspending
        nnoremap <C-z> zvzz
        vnoremap <C-z> <Esc>zv`<ztgv
    " }}}
    " Emacs bindings for home/end {{{
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        inoremap <C-a> <Esc>I
        inoremap <C-e> <Esc>A
    " }}}
    " HTML tag closing {{{
        "inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<CR>a
    " }}}
    " Source $MYVIMRC {{{
        nnoremap <Leader>s :source $MYVIMRC<CR>:echo 'Reloaded $MYVIMRC.'<CR>
    " }}}
    " Source line/selection {{{
        nnoremap <Leader>S ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>
        vnoremap <Leader>S y:execute @@<CR>:echo 'Sourced selection.'<CR>
    " }}}
    " Toggle [i]nvisible characters {{{
        nnoremap <Leader>i :set list!<CR>
    " }}}
    " Drag lines {{{
        execute "set <M-n>=n"
        execute "set <M-e>=e"
        nnoremap <M-n> :m+<CR>
        nnoremap <M-e> :m-2<CR>
        inoremap <M-n> <Esc>:m+<CR><Right>i
        inoremap <M-e> <Esc>:m-2<CR><Right>i
        vnoremap <M-n> :m'>+<CR>gv
        vnoremap <M-e> :m-2<CR>gv
    " }}}
    " Quick editing {{{
        nnoremap <Leader>ev :e $MYVIMRC<CR>
        nnoremap <Leader>eb :e $HOME/.vim/bundles.vim<CR>
        nnoremap <Leader>ec :e $HOME/.vim/bundle/vim-colemak/plugin/colemak.vim<CR>
        nnoremap <Leader>et :e $HOME/.tmux.conf<CR>
    " }}}
    " Toggle relative line numbers {{{
        nnoremap <Leader>n :setlocal relativenumber!<CR>
    " }}}
    " Copy to remote clipboard {{{
        nnoremap <silent> <Leader>y :RemoteClipboardSet<CR>:echo "Sent Vim clipboard \" to remote clipboard."<CR>
        nnoremap <silent> <Leader>Y yy:RemoteClipboardSet<CR>:echo "1 line yanked to remote clipboard."<CR>
    " }}}
    " Paste from remote clipboard {{{
        nnoremap <silent> <Leader>p :RemoteClipboardGet<CR>"rp
        nnoremap <silent> <Leader>P :RemoteClipboardGet<CR>"rP
    " }}}
    " Keep search matches in the middle of the window {{{
    " }}}
    " Stay in middle while jumping around {{{
        nnoremap g; g;zz
        nnoremap g, g,zz
        nnoremap <C-o> <C-o>zz
        nnoremap n nzzzv
        nnoremap N Nzzzv
    " }}}
    " Reselect pasted text {{{
        nnoremap <Leader>v V`]
    " }}}
    " Save with Sudo {{{
        cnoreabbrev <expr> w!!
                    \((getcmdtype() == ':' && getcmdline() == 'w!!')
                    \?('!sudo tee % >/dev/null'):('w!!'))
    " }}}
" }}}
" Autocommands {{{
    " Autowriteall on more events {{{
        augroup AutowriteallPlus
            autocmd!
            autocmd InsertLeave,CursorHold,CursorHoldI,FocusLost * if &autowriteall | :silent update | endif
        augroup END
    " }}}
    " Return to line {{{
        " Vim returns to the same line when you reopen a file.
        augroup ReturnToLine
            autocmd!
            autocmd BufReadPost *
                        \ if line("'\"") > 0 && line("'\"") <= line("$") |
                        \     execute 'normal! g`"zvzz' |
                        \ endif
        augroup END
    " }}}
    " Toggle trailing whitespace {{{
    " Only shown when not in insert mode so I don't go insane.
        augroup ToggleTrailingWhitespace
            autocmd!
            "autocmd InsertEnter * :set listchars-=trail:⌴
            "autocmd InsertLeave * :set listchars+=trail:⌴
            autocmd InsertEnter * :set listchars-=trail:·
            autocmd InsertLeave * :set listchars+=trail:·
        augroup END
    " }}}
    " Help file navigation {{{
        " Use < and > to navigate in the help file
        augroup HelpNavigation
            autocmd!
            autocmd FileType help nnoremap <buffer> < <C-t>|
            autocmd FileType help nnoremap <buffer> > <C-]>|
            autocmd FileType help nnoremap <buffer> <CR> <C-]>|
            autocmd FileType help nnoremap <buffer> <Backspace> <C-t>|
            autocmd FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
            autocmd FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|
        augroup END
    " }}}
    " Resize splits when the window is resized {{{
        augroup ResizeSplitsAtWindowResize
            autocmd!
            autocmd VimResized * :wincmd =
        augroup END
    " }}}
    " Only show cursorline in the current window and in normal mode {{{
        augroup CursorLineInCurrentWindowNormalModeOnly
            autocmd!
            autocmd WinLeave * set nocursorline
            autocmd WinEnter * set cursorline
            autocmd InsertEnter * set nocursorline
            autocmd InsertLeave * set cursorline
        augroup END
    " }}}
" }}}
" Commands {{{
    " Diff original for Vim {{{
        if !exists(":DiffOrig")
            command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
        endif
    " }}}
" }}}
" Functions {{{
    " Create directories {{{
        function! InitBackupDir()
            let l:parent = $HOME . '/.vim/tmp/'
            let l:backup = l:parent . 'backup/'
            let l:tmp = l:parent . 'swap/'
            let l:undo = l:parent . 'undo/'
            if exists('*mkdir')
                if !isdirectory(l:parent)
                    call mkdir(l:parent)
                endif
                if !isdirectory(l:backup)
                    call mkdir(l:backup)
                endif
                if !isdirectory(l:tmp)
                    call mkdir(l:tmp)
                endif
                if !isdirectory(l:undo)
                    call mkdir(l:undo)
                endif
            endif
            if !isdirectory(l:backup)
                echo 'Warning: Unable to create directory ' l:backup '. Using current directory for backup files.'
                set backupdir=.
            endif
            if !isdirectory(l:tmp)
                echo 'Warning: Unable to create directory ' l:tmp '. Using current directory for swap files.'
                set directory=.
            endif
            if !isdirectory(l:undo)
                echo 'Warning: Unable to create directory ' l:undo '. Using current directory for undo files.'
                set undodir=.
            endif
        endfunction
        call InitBackupDir()
    " }}}
    " Visual Selection {{{
        function! CmdLine(str)
            exe "menu Foo.Bar :" . a:str
            emenu Foo.Bar
            unmenu Foo
        endfunction
        function! VisualSelection(command) range
            let l:saved_reg = @"
            execute "normal! vgvy"

            let l:pattern = escape(@", '\\/.*$^~[]')
            let l:pattern = substitute(l:pattern, "\n$", "", "")

            if a:command == 'previous'
                execute "normal ?" . l:pattern . ""
            elseif a:command == 'next'
                execute "normal /" . l:pattern . ""
            elseif a:command == 'replace'
                call CmdLine("%s" . '/'. l:pattern . '/')
            endif

            let @/ = l:pattern
            let @" = l:saved_reg
        endfunction
    " }}}
    " Autoread (enabled) {{{
        " If you are using a console version of Vim, or dealing
        " with a file that changes externally (e.g. a web server log)
        " then Vim does not always check to see if the file has been changed.
        " The GUI version of Vim will check more often (for example on Focus change),
        " and prompt you if you want to reload the file.
        "
        " There can be cases where you can be working away, and Vim does not
        " realize the file has changed. This command will force Vim to check
        " more often.
        "
        " Calling this command sets up autocommands that check to see if the
        " current buffer has been modified outside of vim (using checktime)
        " and, if it has, reload it for you.
        "
        " This check is done whenever any of the following events are triggered:
        " * BufEnter
        " * CursorMoved
        " * CursorMovedI
        " * CursorHold
        " * CursorHoldI
        "
        " In other words, this check occurs whenever you enter a buffer, move the cursor,
        " or just wait without doing anything for 'updatetime' milliseconds.
        "
        " Normally it will ask you if you want to load the file, even if you haven't made
        " any changes in vim. This can get annoying, however, if you frequently need to reload
        " the file, so if you would rather have it to reload the buffer *without*
        " prompting you, add a bang (!) after the command (WatchForChanges!).
        " This will set the autoread option for that buffer in addition to setting up the
        " autocommands.
        "
        " If you want to turn *off* watching for the buffer, just call the command again while
        " in the same buffer. Each time you call the command it will toggle between on and off.
        "
        " WatchForChanges sets autocommands that are triggered while in *any* buffer.
        " If you want vim to only check for changes to that buffer while editing the buffer
        " that is being watched, use WatchForChangesWhileInThisBuffer instead.
        "
        command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
        command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
        command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

        " WatchForChanges function
        "
        " This is used by the WatchForChanges* commands, but it can also be
        " useful to call this from scripts. For example, if your script executes a
        " long-running process, you can have your script run that long-running process
        " in the background so that you can continue editing other files, redirects its
        " output to a file, and open the file in another buffer that keeps reloading itself
        " as more output from the long-running command becomes available.
        "
        " Arguments:
        " * bufname: The name of the buffer/file to watch for changes.
        "     Use '*' to watch all files.
        " * options (optional): A Dict object with any of the following keys:
        "   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
        "     addition to setting up the autocommands.
        "   * toggle: If set to 1, causes this behavior to toggle between on and off.
        "     Mostly useful for mappings and commands. In scripts, you probably want to
        "     explicitly enable or disable it.
        "   * disable: If set to 1, turns off this behavior (removes the autocommand group).
        "   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
        "     buffer you are editing. (Only the specified buffer will be checked for changes,
        "     though, still.) If set to 1, the events will only be triggered while
        "     editing the specified buffer.
        "   * more_events: If set to 1 (the default), creates autocommands for the events
        "     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
        "     (Presumably, having too much going on for those events could slow things down,
        "     since they are triggered so frequently...)
        function! WatchForChanges(bufname, ...)
            " Figure out which options are in effect
            if a:bufname == '*'
                let id = 'WatchForChanges'.'AnyBuffer'
                " If you try to do checktime *, you'll get E93: More than one match for * is given
                let bufspec = ''
            else
                if bufnr(a:bufname) == -1
                echoerr "Buffer " . a:bufname . " doesn't exist"
                return
                end
                let id = 'WatchForChanges'.bufnr(a:bufname)
                let bufspec = a:bufname
            end

            if len(a:000) == 0
                let options = {}
            else
                if type(a:1) == type({})
                let options = a:1
                else
                echoerr "Argument must be a Dict"
                end
            end
            let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
            let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
            let disable     = has_key(options, 'disable')     ? options['disable']     : 0
            let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
            let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

            if while_in_this_buffer_only
                let event_bufspec = a:bufname
            else
                let event_bufspec = '*'
            end

            let reg_saved = @"
            "let autoread_saved = &autoread
            let msg = "\n"

            " Check to see if the autocommand already exists
            redir @"
                silent! exec 'au '.id
            redir END
            let l:defined = (@" !~ 'E216: No such group or event:')

            " If not yet defined...
            if !l:defined
                if l:autoread
                let msg = msg . 'Autoread enabled - '
                if a:bufname == '*'
                    set autoread
                else
                    setlocal autoread
                end
                end
                silent! exec 'augroup '.id
                if a:bufname != '*'
                    "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
                    "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
                    exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
                end
                    exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
                    exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
                    exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

                " The following events might slow things down so we provide a way to disable them...
                " vim docs warn:
                "   Careful: Don't do anything that the user does
                "   not expect or that is slow.
                if more_events
                    exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
                    exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
                end
                augroup END
                let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
            end

            " If they want to disable it, or it is defined and they want to toggle it,
            if l:disable || (l:toggle && l:defined)
                if l:autoread
                let msg = msg . 'Autoread disabled - '
                if a:bufname == '*'
                    set noautoread
                else
                    setlocal noautoread
                end
                end
                " Using an autogroup allows us to remove it easily with the following
                " command. If we do not use an autogroup, we cannot remove this
                " single :checktime command
                " augroup! checkforupdates
                silent! exec 'au! '.id
                silent! exec 'augroup! '.id
                let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
            elseif l:defined
                let msg = msg . 'Already watching ' . bufspec . ' for external updates'
            end

            "echo msg
            let @"=reg_saved
        endfunction
        " Enable for all buffers at startup
        execute WatchForChanges("*", {'autoread':1})
    " }}}
" }}}
" Plugin Settings and Fixes {{{
    let g:rainbow_active = 1
    let g:rainbow_operators = 1
    let g:Powerline_symbols = 'fancy'
    let perl_extended_vars = 1 " Highlight advanced Perl variables inside strings

    let g:SuperTabCrMapping = 0 " Fix, https://github.com/ervandew/supertab/issues/54
    let g:surround_no_mappings = 1 " Fix for Colemak.vim
    silent! call yankstack#setup() " Fix, https://github.com/maxbrunsfeld/vim-yankstack/issues/9

    " Fix for Colemak.vim, mapped in tpope/vim-fugitive, stalls 'y' which should act as regular 'w'
        augroup RemoveFugitiveMappingForColemak
            autocmd!
            autocmd BufEnter * if mapcheck("y<C-G>", "n") == ":call setreg(v:register, <SNR>33_recall())<CR>" | execute "nunmap <buffer> <silent> y<C-G>" | endif
        augroup END

    " Colemak.vim (reload to be last)
        silent! source $HOME/.vim/bundle/vim-colemak/plugin/colemak.vim
    " Vim Pager
        let vimpager_scrolloff = 99999
        if exists("vimpager")
            set nolist
        endif
" }}}
" Local Vim Configuration {{{
    silent! source $HOME/.vimrc.local
" }}}

