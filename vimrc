"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"As pathogen is used as a submodule, first add its path to the runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

"Then pathogen is called do add all the plugins
execute pathogen#infect()

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

let g:tex_flavor='latex'

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"make Y consistent with C and D
nnoremap Y y$

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

"statusline setup
set statusline=%f       "tail of the filename
set statusline+=%m      "modified flag
set statusline+=%=      "left/right separator
set statusline+=%{strlen(&ft)?&ft:'none'}\ -\      "filetype
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
"set list
"set listchars=tab:\ \ ,extends:>,precedes:<
" disabling list because it interferes with soft wrap

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
"set mouse=a
"set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"NERD_Tree conf
let NERDTreeWinPos="right"
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>

"yankring_history on .vim folder
let g:yankring_history_dir='$HOME/.vim/'

"set railscasts colorscheme when running vim in gnome terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
  colorscheme railscasts
else
  colorscheme default
endif

"BufExplorer binding
noremap <silent> <Leader>b :BufExplorerHorizontalSplit<CR>
