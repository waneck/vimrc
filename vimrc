" Maintainer:   Markus Mottl  <markus.mottl@gmail.com>
" Tweaked by: Cauë Waneck
" URL:          https://bitbucket.org/mmottl/vim-files

" I want Vim, not Vi
set nocompatible

" Don't want to type indentation
set autoindent

" Automatically write buffer before special actions
set autowrite

" Set formatting of text and comments
set formatoptions=tn1

" My default format program
set formatprg=fmt\ -w\ 80\ -s

" Only hide invisible buffers (keeps their editing state)
set hidden

" Command line history
set history=1000

" Highlight matches
set hlsearch

" Set options for autocompletion
set noinfercase

" Always want statusline
set laststatus=2

" When we do wrap visibly (by calling set wrap), break in reasonable places
set linebreak

" Set statusline
"set statusline=%F%m%r%h%w\ %y\ [pos=%l,%v]\ [len=%L\ (%p%%)]

" Don't display macro steps
set lazyredraw

" Don't move cursor to first line when scrolling
set nostartofline

" Want mouse support
"set mouse=a

" Maintain some more context around the cursor
set scrolloff=3
set sidescrolloff=3

" Indent/outdent to nearest tab stop
set shiftround

" Not too deep, not too shallow
set shiftwidth=2

" Show size of visual selection
set showcmd

" Show matching braces
set showmatch

" We want fancy tab handling
set smarttab

" Want better buffer handling in quickfix mode
set switchbuf=useopen,usetab

" Tabs are 2 characters
set tabstop=2
set noexpandtab

" Don't wrap words
set textwidth=0

" Set the terminal title
set title

" Remember some stuff after quiting vim: marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" No beeps - don't want to annoy neighbors
"set visualbell

" Expand the command line using tab
set wildmenu
set wildmode=list:longest,full

" Use UTF-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Backspacing + deleting and wrapping of lines
set backspace=start,eol,indent whichwrap=b,s,l,h,<,>,[,]
map <BS> dh
map  <BS>
map!  <BS>
map  [3~ <Del>
map! [3~ <Del>

" File types
:syntax on
:filetype plugin indent on

" Set autoclose pairs for autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"'}

" Better syntax highlighting for shell scripts.
" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell, which very few use
let g:is_posix = 1

" Colors for color xterms
"if has("terminfo")
"  set t_Co=8
"  set t_Sf=[3%p1%dm
"  set t_Sb=[4%p1%dm
"  set <S-Up>=O2A
"  set <S-Down>=O2B
"  set <S-Left>=O2D
"  set <S-Right>=O2C
"else
"  set t_Co=8
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif

" Use my color preferences
set background=dark

" Ex-mode is pretty dumb, remap Q to reformat the current paragraph
nnoremap Q gqip

" Function key settings - 'make'-shortcuts
map <F5> :cp<CR>
map <F6> :cn<CR>

" Have <F2> toggle paste
set pastetoggle=<F2>

" Have <F3> toggle spelling mode
nmap <F3> :setlocal invspell spelllang=en_us<CR>

" Leave editor quickly (when saved)
map <C-X> :q<CR>

" , is a more convenient leader than \
let maplocalleader = ",,"
let mapleader = ","

" Underline the current line with - in normal mode
nnoremap <leader>u yyp<c-v>$r-

" Underline the current line with = in normal mode
nnoremap <leader>U yyp<c-v>$r=

" Map arrows to various window and tab movements
map    <S-Right>   :tabnext<CR>
map    <S-Left>    :tabprev<CR>
imap   <S-Right>   <esc>:tabnext<CR>
imap   <S-Left>    <esc>:tabprev<CR>
map    <S-Up>      <esc><C-w><Up>
map    <S-Down>    <esc><C-w><Down>
imap   <S-Up>      <esc><C-w><Up>
imap   <S-Down>    <esc><C-w><Down>

" OCaml stuff
let no_ocaml_comments = 1
" set makeprg=ocamlbuild\ -no-links\ -use-ocamlfind\ all.otarget

" Remove GUI-nonsense
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Always show the menu, insert longest match
set completeopt=menu,longest

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.aux,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,$.cmxs,*.omc,*.annot,*.exe,*.native,*.byte,*.bc,*.sums,*.spit,*.spot

" Change directories automatically
autocmd BufEnter * lcd %:p:h

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Our shell code looks like a scheme programmer made up all the names
autocmd FileType sh set iskeyword=~,@,48-57,_,192-255,-

" Set location for NetrW bookmarks and history
let g:netrw_home=$HOME

" Load Pathogen
call pathogen#infect()

" Load matchit
runtime! macros/matchit.vim

" SnipMate stuff
let g:snips_author = 'Markus Mottl'

" MRU-functionality
nnoremap <leader>m :MRU<CR>

" FuF-functionality
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fb :FufCoverageFile<CR>
nnoremap <leader>fl :FufLine<CR>
nnoremap <leader>fj :FufJumpList<CR>
nnoremap <leader>fc :FufChangeList<CR>

" NERDTree
nnoremap <leader>n :NERDTree<CR>

" Make
nnoremap <leader>M :make<CR>

" Turn off match highlighting
nnoremap <leader>h :nohlsearch<CR>

" Save quickly
nnoremap <leader>w :w<CR>

if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

colors vimTheme
filetype plugin indent on

set ts=2
set sw=2
set sts=2
set tw=0
set autoindent

" set number

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.haxe = '\v([\]''"]|\w)(\.|\()'

let omlet_indent_let=0

map <F4> :call vaxe#ImportClass()<CR>
map <F12> :call vaxe#Ctags()<CR>

autocmd BufWritePre *.ml,*.hx :%s/\s\+$//e
autocmd BufReadPost,BufNewFile *.ml,*.hx :set noexpandtab

"warn if file changed
au FileChangedShell * echo "Warning: File changed on disk"

"highlight variable under cursor
:autocmd CursorMoved * exe printf('match DiffText /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"set paste toggle for F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

nnoremap <C-H> :call vaxe#ProjectHxml()<CR>
inoremap <C-Space> <C-X><C-O>
inoremap <Nul> <C-X><C-O>

noremap <C-I> <ESC>:call vaxe#ImportClass()<CR>
noremap <C-T> <ESC>:call vaxe#Ctags()<CR>

noremap <C-E> :TComment<CR>
inoremap <C-E> <C-O>:TComment<CR>

call tcomment#DefineType('haxe',                '// %s'    )
call tcomment#DefineType('haxe_inline',         g:tcommentInlineC  )
call tcomment#DefineType('haxe_block',          g:tcommentBlockC   )

set noexpandtab

nnoremap <C-O> :CtrlP /usr/lib/haxe/std<CR>

noremap <F5> <ESC>:make<CR>
inoremap <F5> <ESC>:make<CR>
noremap <C-F5> <ESC>:make haxe<CR>
inoremap <C-F5> <ESC>:make haxe<CR>
noremap <F8> <ESC>:w<CR>
inoremap <F8> <ESC>:w<CR>

noremap <leader>c "+y
vnoremap <leader>c "+y
noremap <leader>v "+p
vnoremap <leader>v "+p

noremap J gT
vnoremap J gT
noremap K gt
vnoremap K gt
