"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd         "show incomplete cmds down the bottom
set showmode        "show current mode down the bottom

set incsearch       "find the next match as we type the search
set hlsearch        "hilight searches by default

set number          "add line numbers
set wrap linebreak
set showbreak=...
"set showbreak=↪\ 

"adds to the path recursively
set path+=**

"show line in column 80
set colorcolumn=80

"disable visual bell
set visualbell t_vb=

"spellcheck langs
set spelllang=en_us,pt_br

"read tex files as latex
let g:tex_flavor='latex'

"set *.v files to Verilog
au BufNewFile,BufRead *.v set ft=verilog

"spellcheck for txt and tex files
au BufNewFile,BufRead,BufEnter *.tex setlocal spell
au BufNewFile,BufRead,BufEnter *.txt setlocal spell

"make Y consistent with C and D
nnoremap Y y$

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk

"statusline setup when lighline is not present
set statusline=%f               "tail of the filename
set statusline+=%m              "modified flag
set statusline+=%=              "left/right separator
set statusline+=%{strlen(&ft)?&ft:'none'}\ -\      "filetype
set statusline+=%c,             "cursor column
set statusline+=%l/%L           "cursor line/total lines
set statusline+=\ %P            "percent through file
set laststatus=2

"indent settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

"vim.sensible stuff
set complete-=i
set smarttab
set nrformats-=octal
if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
set ruler
set display+=lastline
set encoding=utf-8

"set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set listchars=tab:→\ ,eol:↲,space:␣,nbsp:+,trail:•,extends:⟩,precedes:⟨

set formatoptions+=j " Delete comment character when joining commented lines

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread

if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options



"indent settings for specific langs
au FileType ruby setlocal ts=2 sw=2 sts=2
au FileType tex setlocal ts=2 sw=2 sts=2 tw=79 fo+=t fo-=l
au FileType markdown setlocal ts=2 sw=2 sts=2

"folding settings
set foldmethod=indent           "fold based on indent
set foldnestmax=3               "deepest fold is 3 levels
set nofoldenable                "dont fold by default

"tab completion on command line
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=5
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on
"turn on syntax highlighting
syntax on

"dont continue comments when pushing o/O
au FileType * set formatoptions-=o

"hide buffers when not displayed
set hidden

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"setting dir for swp files
set dir=$HOME/.vim/tmp//,/tmp//
set backupdir=$HOME/.vim/tmp//,/tmp//
set backup

"save undos after file closes
set undofile
set undodir=$HOME/.vim/tmp//,/tmp// " where to save undo histories
set undolevels=100         " How many undos
set undoreload=1000       " number of lines to save for undo

"set railscasts colorscheme when running vim in gnome terminal
if split($TERM,"-")[1] ==? '256color'
  set t_Co=256
  colorscheme railscasts
else
  colorscheme default
endif

" ***********************
" *** Plugin Settings ***
" ***********************
"plugins are managed by Vim8 native system simply add the plugin folder
"to ~/.vim/pack/dvcirilo/start/ or use git submodules
"optional plugins (which have to be manually loaded below
"shoud be placed in ~/.vim/pack/dvcirilo/opt/

"use packadd to add optional plugins
packadd! matchit         "included matchit plugin

"NERD_Tree conf
let NERDTreeWinPos="left"
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
