"
""iolorscheme markus


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
set makeprg=ocamlbuild\ -no-links\ -use-ocamlfind\ all.otarget

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

colors twilight
filetype plugin indent on

set ts=2
set sw=2
set sts=2
set tw=0
set autoindent

set number

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.haxe = '\v([\]''"]|\w)(\.|\()'

let omlet_indent_let=0
