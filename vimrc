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
set wrap linebreak nolist
set showbreak=...

"show line in column 80 
set colorcolumn=80

"make Y consistent with C and D
nnoremap Y y$

"disable visual bell
set visualbell t_vb=

"spellcheck for txt and tex files
set spelllang=en_us,pt_br
au BufNewFile,BufRead,BufEnter *.tex setlocal spell
au BufNewFile,BufRead,BufEnter *.txt setlocal spell

"read tex files as latex
let g:tex_flavor='latex'

"set *.v files to Verilog
au BufNewFile,BufRead *.v set ft=verilog

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk

"statusline setup
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

"indent settings for specific langs
au FileType ruby setlocal ts=2 sw=2 sts=2

"folding settings
set foldmethod=indent           "fold based on indent
set foldnestmax=3               "deepest fold is 3 levels
set nofoldenable                "dont fold by default

"tab completion on command line
set wildmode=list:longest       "make cmdline tab completion similar to bash
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
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

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/tmp//,/tmp// " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000       " number of lines to save for undo

"set railscasts colorscheme when running vim in gnome terminal
if $TERM == 'xterm-256color'
  set t_Co=256
  colorscheme railscasts
else
  colorscheme default
endif

" ***********************
" *** Plugin Settings ***
" ***********************
"plugins are managed by Vim8 native system
"simply add the plugin folder to ~/.vim/pack/bundle/start/
"or use git submodules

"NERD_Tree conf
let NERDTreeWinPos="left"
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>
