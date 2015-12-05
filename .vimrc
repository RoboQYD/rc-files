set nocompatible              " be iMproved, required

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
map <leader>t :FuzzyFinderTextMate<CR>
" ~/.vimrc
" Marcel Molina Jr. <marcel@vernix.org>

" Options
set expandtab
set nocompatible " vim settings rather than vi settings
set bs=2 " always allow backspacing in insert mode
set sw=2 " number of spaces to use for auto indent
set textwidth=79 " maximum line width
set nowrap
set scrolloff=1 " minimum lines between cursor and window edge
set ic " ignores case in searches
set incsearch " searches as you type
set smartcase " match 'word' case-insensitive / 'Word' case-sensitive
set showmatch " shows matching parenthesis, bracket, or brace
set showcmd " show commands while they're being typed
set ruler " always display cursor
set background=dark " essentially makes highlighting all bold
set pastetoggle=<F9> " toggles between paste and nopaste mode
set ai " set autoindenting on
" set laststatus=2 " Always display a status line at the bottom of the window
set tabstop=2 " tabs is 4 spaces
set softtabstop=2 " 4-space tabs
set nosmartindent
"only turn on cindent if it's a c file...
"set cindent
set showmode " displays mode in status line
colorscheme default

filetype on
filetype indent on
filetype plugin on


map <F3> ggg?G " rot-13 for obfuscation
map <F12> <C-W>w

" 'Paste' from clipboard.
map <m-s-p> "*p

" 'Copy' to clipboard.
map <m-s-y> "*Y
vmap <m-s-y> "*y

" 'Cut' to clipboard.
map <m-s-x> "*x
vmap <m-s-x> "*x

" Tab completion!
function InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Timestamp in status-lin
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Toggle search result highlighting
map <F4> :set nohls!<CR>:set nohls?<CR>

" turn tabs into spaces
map <ESC>t :%! expand -t2<CR>

" If the terminal has colors turn on syntax highlighting
" Highlight the most recent search pattern
if &t_Co > 2 || has("gui_running")
  syntax on
  " set hlsearch
endif
