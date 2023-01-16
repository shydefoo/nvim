-- TODO: Port to lua
vim.cmd([[
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => General
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Sets how many lines of history VIM has to remember
    set history=500
    
    " Enable filetype plugins
    filetype plugin on
    filetype indent on
    
    " Set to auto read when a file is changed from the outside
    set autoread
    
    " Fast saving
    nmap <leader>w :w!<cr>
    
    " :W sudo saves the file 
    " (useful for handling the permission-denied error)
    command W w !sudo tee % > /dev/null
]])
vim.cmd([[
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => VIM user interface
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set 7 lines to the cursor - when moving vertically using j/k
    set so=7
    
    " Avoid garbled characters in Chinese language windows OS
    let $LANG='en' 
    set langmenu=en
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    
    " Turn on the Wild menu
    set wildmenu
    
    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
    else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    endif
    
    "Always show current position
    set ruler
    
    " Height of the command bar
    set cmdheight=2
    
    " A buffer becomes hidden when it is abandoned
    set hid
    
    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
    
    " Ignore case when searching
    set ignorecase
    
    " When searching try to be smart about cases 
    set smartcase
    
    " Highlight search results
    set hlsearch
    
    " Makes search act like search in modern browsers
    set incsearch 
    
    " Don't redraw while executing macros (good performance config)
    set lazyredraw 
    
    " For regular expressions turn magic on
    set magic
    
    " Show matching brackets when text indicator is over them
    set showmatch 
    " How many tenths of a second to blink when matching brackets
    set mat=2
    
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    
    " Properly disable sound on errors on MacVim
    if has("gui_macvim")
        autocmd GUIEnter * set vb t_vb=
    endif
    
    
    " Add a bit extra margin to the left
    set foldcolumn=1
    

]])

vim.cmd([[
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Colors and Fonts
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable syntax highlighting
    syntax enable 
    
    " Enable 256 colors palette in Gnome Terminal
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif
    
    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions-=T
        set guioptions-=e
        set t_Co=256
        set guitablabel=%M\ %t
    endif
    
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8
    
    " Use Unix as the standard file type
    set ffs=unix,dos,mac
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Files, backups and undo
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Text, tab and indent related
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Use spaces instead of tabs
    set expandtab
    
    " Be smart when using tabs ;)
    set smarttab
    
    " 1 tab == 4 spaces
    set shiftwidth=4
    set tabstop=4
    
    " Linebreak on 500 characters
    set lbr
    set tw=500
    
    set ai "Auto indent
    set si "Smart indent
    set wrap "Wrap lines
    
    
    """"""""""""""""""""""""""""""
    " => Visual mode related
    """"""""""""""""""""""""""""""
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Moving around, tabs, windows and buffers
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
    map <space> /
    map <c-space> ?
    
    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>
    
    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    
    " Close the current buffer
    map <leader>bd :Bclose<cr>:tabclose<cr>gT
    
    " Close all the buffers
    map <leader>ba :bufdo bd<cr>
    
    map <leader>l :bnext<cr>
    map <leader>h :bprevious<cr>
    
    " Useful mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove 
    map <leader>t<leader> :tabnext 
    map <leader>tp :tabprevious
    
    " Let 'tl' toggle between this and the last accessed tab
    let g:lasttab = 1
    nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()
    
    
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    
    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>
    
    " Specify the behavior when switching between buffers 
    try
      set switchbuf=useopen,usetab,newtab
      set stal=2
    catch
    endtry
    
    " Return to last edit position when opening files (You want this!)
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    
    
    """"""""""""""""""""""""""""""
    " => Status line
    """"""""""""""""""""""""""""""
    " Always show the status line
    set laststatus=2
    
    " Format the status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Editing mappings
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Remap VIM 0 to first non-blank character
    map 0 ^
    
    " Move a line of text using ALT+[jk] or Command+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
    
    if has("mac") || has("macunix")
      nmap <D-j> <M-j>
      nmap <D-k> <M-k>
      vmap <D-j> <M-j>
      vmap <D-k> <M-k>
    endif
    
    " Delete trailing white space on save, useful for some filetypes ;)
    fun! CleanExtraSpaces()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfun
    
    if has("autocmd")
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    endif
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Spell checking
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    
    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Misc
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    
    " Quickly open a buffer for scribble
    map <leader>q :e ~/buffer<cr>
    
    " Quickly open a markdown buffer for scribble
    map <leader>x :e ~/buffer.md<cr>
    
    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>
    
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Clipboard
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    tnoremap <Esc> <C-\><C-n>
    " always use clipboard for all operations 
    set clipboard +=unnamedplus

    
]])

vim.cmd([[
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Helper functions
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        endif
        return ''
    endfunction

    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"
    
        let l:pattern = escape(@", "\\/.*'$^~[]")
        let l:pattern = substitute(l:pattern, "\n$", "", "")
    
        if a:direction == 'gv'
            call CmdLine("Ack '" . l:pattern . "' " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        endif
    
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
]])

vim.cmd([[
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => GUI related
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set font according to system
    if has("mac") || has("macunix")
        set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
    elseif has("win16") || has("win32")
        set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    elseif has("gui_gtk2")
        set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("linux")
        set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("unix")
        set gfn=Monospace\ 11
    endif
    
    " Disable scrollbars (real hackers don't use scrollbars for navigation!)
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Fast editing and reloading of vimrc configs
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <leader>e :e! ~/.config/nvim/init.vim<cr>
    autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Turn persistent undo on 
    "    means that you can undo even when you close a buffer/VIM
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    try
        set undodir=~/.config/nvim/temp_dirs/undodir
        set undofile
    catch
    endtry
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Command mode related
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Smart mappings on the command line
    cno $h e ~/
    cno $d e ~/Desktop/
    cno $j e ./
    cno $c e <C-\>eCurrentFileDir("e")<cr>
    
    " $q is super useful when browsing on the command line
    " it deletes everything until the last slash 
    cno $q <C-\>eDeleteTillSlash()<cr>
    
    " Bash like keys for the command line
    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>
    
    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>
    
    " Map ½ to something useful
    map ½ $
    cmap ½ $
    imap ½ $
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Parenthesis/bracket
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $t <esc>`>a`<esc>`<i`<esc>
    vnoremap $6 <esc>`>a~<esc>`<i~<esc>
    
    " Map auto complete of (, ", ', [
    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => General abbreviations
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Omni complete functions
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Ack searching and cope displaying
    "    requires ack.vim - it's much better than vimgrep/grep
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Use the the_silver_searcher if possible (much faster than Ack)
    if executable('ag')
      let g:ackprg = 'ag --vimgrep --smart-case'
    endif
    
    " When you press gv you Ack after the selected text
    vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
    
    " Open Ack and put the cursor in the right position
    map <leader>g :Ack 
    
    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
    
    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with Ack, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>
    
    
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Helper functions
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    func! DeleteTillSlash()
        let g:cmd = getcmdline()
    
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
        endif
    
        if g:cmd == g:cmd_edited
            if has("win16") || has("win32")
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
            else
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
            endif
        endif   
    
        return g:cmd_edited
    endfunc
    
    func! CurrentFileDir(cmd)
        return a:cmd . " " . expand("%:p:h") . "/"
    endfunc
    
    set termguicolors
]])
-- " Don't close window, when deleting a buffer
-- command! Bclose call <SID>BufcloseCloseIt()
-- function! <SID>BufcloseCloseIt()
--     let l:currentBufNum = bufnr("%")
--     let l:alternateBufNum = bufnr("#")

--     if buflisted(l:alternateBufNum)
--         buffer #
--     else
--         bnext
--     endif

--     if bufnr("%") == l:currentBufNum
--         new
--     endif

--     if buflisted(l:currentBufNum)
--         execute("bdelete! ".l:currentBufNum)
--     endif
-- endfunction

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
