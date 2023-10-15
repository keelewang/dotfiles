call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
Plug 'Valloric/YouCompleteMe'

call plug#end()

filetype plugin on
filetype indent on
let $LANG='en'
set langmenu=en
set autoread
set number
set cursorline
set laststatus=2
set virtualedit=block,onemore
set wildmenu
set completeopt-=preview
set rtp+=/opt/homebrew/opt/fzf
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set tm=500
syntax enable
set regexpengine=0
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

colorscheme one
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

au FocusGained,BufEnter * silent! checktime
au FocusGained,BufEnter * silent! call AutoSwitchTheme() 

let mapleader = ","

nmap <leader>w :w!<cr>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


map <space> /
map <C-space> ?

map <silent> <leader><cr> :noh<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>:tabclose<cr>gT

map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

map <leader>cd :cd %:p:h<cr>:pwd<cr>


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
map 0 ^

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

fun! AutoSwitchTheme()
    let os_theme = system('defaults read -g AppleInterfaceStyle')
    if os_theme == "Dark\n"
        set background=dark
    else
        set background=light
    endif

    highlight PMenu ctermfg=0 ctermbg=247 guifg=black guibg=darkgrey
    highlight PMenuSel ctermfg=247 ctermbg=8 guifg=darkgrey guibg=black
endfunction

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


map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

map <leader>q :e ~/buffer<cr>

map <leader>x :e ~/buffer.md<cr>

map <leader>pp :setlocal paste!<cr>


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
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

" YCM
 let g:ycm_add_preview_to_completeopt = 0
 "let g:ycm_show_diagnostics_ui = 0
 let g:ycm_server_log_level = 'info'
 let g:ycm_min_num_identifier_candidate_chars = 2
 let g:ycm_collect_identifiers_from_comments_and_strings = 1
 let g:ycm_complete_in_strings=1
 let g:ycm_key_invoke_completion = '<c-z>'
 set completeopt=menu,menuone

 noremap <c-z> <NOP>

 let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                       \ 'cs,lua,javascript': ['re!\w{2}'],
                                   \ }
