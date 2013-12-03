" Maciek's vimrc
" current list of extensions I'm using:
"
" Tagbar: Taglist++, source code browsing (requires exuberant-ctags pkg
"   >=v5.5) (currently mapped to <leader>1)
"	NERDTree: better file explorer, i.e. replaces :Ex and :Vex (mapped to
"   <leader>2)
"	NERDCommenter: easy mappings for inserting comments ('<leader>cc' etc in cmd mode to use)
"	Grepvim: grep integration (use :Grep, among other things)
"	Bufexplorer: easy buffer navigation (just use <leader>be)
"	FuzzyFinder: search files, buffers, tags etc. (e.g. <leader>ff)
"   -> L9lib: required for FuF
" AutoloadCscope: forces Cscope to recurse up parent dirs to find the
"   database (build db with cscope -R -b, add -q to build inverted index for
"   quicker lookups, add -k when doing kernel/lib hacking to tell cscope to
"   ignore /usr/include)
" NeoComplCache: pop-down menu for autocompletion

filetype off

" set us up some vundle magic
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" its the vundle
Bundle 'gmarik/vundle'

" github repos
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
"Bundle 'Lokaltog/vim-powerline.git'
Bundle 'bling/vim-airline'
Bundle 'wlangstroth/vim-racket.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'jnwhiteh/vim-golang.git'
Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'wting/rust.vim'
"Bundle 'Valloric/YouCompleteMe.git'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on
" ================
" GENERAL SETTINGS
" ================

""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""
syntax enable

" old vim?
if version >= 720
    set colorcolumn=80
    " save my undo history for this buff along with the file
    " could save some headaches
    " the // causes fully qualified path to be in the swp name
    set undofile
    set undodir=~/.vim/tmp/undo//,~/.tmp//,/tmp//
    " max number of undos; default is 1000 on UNIX
    "set undolevels=500
    " max number of lines to save in the .un file, default is 10000
    "set undorelad=500
endif

"set bg=dark
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme="dark"

" Terminal 256 colors
set t_Co=256

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac

" show line numbers
set number

" vive le vim!
set nocompatible

" better filename completion in vim command line
set wildmode=list:longest,full
set wildmenu

" underline!
set cursorline
"set cursorcolun

" Search/replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" tell me when i'm in insert or visual mode
set showmode

" show me the command being typed currently
set showcmd

" don't ding at me
set noerrorbells
set novisualbell 

" where to put swp files
set directory=~/.vim/tmp/swp//,~/.tmp//,/tmp//

" don't create foo~ files
set nobackup

" to try to get rid of 'hit ENTER to continue' prompts
set shortmess=a
set cmdheight=1

" always give me at least 3 lines before and after cursor
set scrolloff=3

" tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" avoid that damn "no write since last change" warning when
" switching buffers
set hidden

set encoding=utf-8
set shell=/bin/zsh

" tell Ctags to recurse up directories 
" for the tags file
set tags=tags;/
" use cscope in addition to ctags
source ~/.vim/cscope_maps.vim

" aesthetics
set background=dark

" not all terms are 256 :(
if &t_Co == 256
    colorscheme molokai
    "let g:solarized_termcolors=256
    "colorscheme solarized
endif
     
" show status line at bottom 0=never, 1=when > 1 window open
" 2=always
set laststatus=2
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current 
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in 
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer


" with these, if you include capitals in a search it'll do
" the right thing, if you just use lowercase,
" it'll be case insensitive
set ignorecase
set smartcase

" %s/p/r -> %s/p/r/g
set gdefault

" highlight search results as I type
set incsearch
set showmatch
" but allow me to get rid of the highlighting afterwards with ,space
nnoremap <CR> :noh<CR>

" line wrapping
"set wrap
"set textwidth=80
set formatoptions=qrtn1
" tell me when i'm running on too long
set colorcolumn=80
"highlight OverLength ctermbg=red 
"ctermfg=white
"match OverLength /\%80v.\+/

"set up code folding
set nofoldenable     "don't fold by default
set foldmethod=indent   " fold on indentations
set foldnestmax=10   "only fold up to 10 levels
set foldlevel=1     " only show me first fold level


" save buffers when we move away from vim
"au FocusLost * :wa

" allow bs to erase previously entered chars, autoindent, \n's etc
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
"set smartindent

" let me use mouse in all modes
"set mouse=a


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" do the restore
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	au BufWinEnter * call ResCur()
augroup END


" === KEY MAPPINGS ===

" change <leader> key. defaults is '\', hard to reach
let mapleader=","

" use perl-like regexes in search
"nnoremap / /\v
"vnoremap / /\v

" use Tab instead of '%' to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" quick window split with ,s[vh] (vertical, horizontal)
nnoremap <leader>sv <C-w>v<C-w>l
nnoremap <leader>sh <C-w>s<C-w>j
set splitright
set splitbelow

" move around splits faster
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" key mapping to toggle spell checker (apparently this will do the right thing in
" source files. Use zg to whitelist a word
nnoremap <leader>sp :setlocal spell!<CR>


" let me edit my vimrc quickly with ,ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
" autoreload vimrc when it's edited
autocmd! bufwritepost vimrc source ~/.vim/vimrc
" quickly reload vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>

" quicker than reaching for escape
inoremap jj <ESC>

" quick save
nnoremap <leader>w :w<CR>

" sudo save
cnoremap w!! w !sudo tee % > /dev/null

set title

" Insert a lambda: mostly for scheme and haskell
imap <C-Bslash> λ

" Use better syntax highlighting for ASM
let g:asmsyntax="asmx86"

" Haskell Mode
let g:haddock_browser = "/usr/bin/google-chrome"
au Bufenter *.hs compiler ghc

" =======================
" PLUGIN-SPECIFIC OPTIONS
" =======================

"=== Tagbar ===
"make TagBar a little easier: press ',1' in command mode to bring it up
let g:tagbar_usearrows = 1
nnoremap <leader>1 :TagbarToggle<CR>
" Uncomment this line to open Tagbar on startup for code files
" au BufRead *.[ch],*.cpp,*.java,*.js,*.py,*.pl TagbarOpen

"=== NERDTree ===
nnoremap <leader>2 :NERDTreeToggle<CR>

"=== FuzzyFinder ===
nnoremap <leader>f :FufFile<CR>   " search files
nnoremap <leader>b :FufBuffer<CR> " search buffers
nnoremap <leader>d :FufDir<CR>    " search directories

"=== NeoComplCache ===
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"=== rainbow parens ===
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"=== CTRLP ===
let g:ctrlp_cmd = "CtrlPBuffer"
