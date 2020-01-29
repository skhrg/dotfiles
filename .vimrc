set history=50
set ruler

execute pathogen#infect()

syntax enable
set background=dark
colorscheme solarized

syntax on
filetype on
filetype indent on
filetype plugin on

set hlsearch
set nu
set showmatch
set showmode
set wildchar=<TAB>
set wildmenu

set autoindent
set copyindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set laststatus=2

set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

let mapleader = " "

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

imap <C-w> <C-o><C-w>
imap <A-Up> <C-o><A-Up>
imap <A-Down> <C-o><A-Down>
imap <A-Left> <C-o><A-Left>
imap <A-Right> <C-o><A-Right>

set splitbelow
set splitright

set mousefocus

let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

let g:airline#extensions#tabline#enabled = 1

nmap <C-t> :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

