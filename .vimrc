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

nmap <silent> <Esc>h :sp<CR>
nmap <silent> <Esc>v :vsplit<CR>
nmap <silent> <Esc>w :wincmd c<CR>
nmap <silent> <Esc>[1;3A :wincmd k<CR>
nmap <silent> <Esc>[1;3B :wincmd j<CR>
nmap <silent> <Esc>[1;3D :wincmd h<CR>
nmap <silent> <Esc>[1;3C :wincmd l<CR>
nmap <silent> <Esc>. :wincmd ><CR>
nmap <silent> <Esc>, :wincmd <<CR>
nmap <silent> <Esc>; :wincmd -<CR>
nmap <silent> <Esc>' :wincmd +<CR>
nmap <silent> <Esc>= :wincmd =<CR>
nmap <silent> <Esc>t :wincmd T<CR>
nmap <silent> <Esc>x :wincmd x<CR>
nmap <silent> <Esc>[ :wincmd R<CR>
nmap <silent> <Esc>] :wincmd r<CR>
nmap <silent> <leader><Esc>[1;3A :wincmd K<CR>
nmap <silent> <leader><Esc>[1;3B :wincmd J<CR>
nmap <silent> <leader><Esc>[1;3D :wincmd H<CR>
nmap <silent> <leader><Esc>[1;3C :wincmd L<CR>

imap <Esc>h <C-o><Esc>h
imap <Esc>v <C-o><Esc>v
imap <Esc>w <C-o><Esc>w
imap <Esc>[1;3A <C-o><Esc>[1;3A
imap <Esc>[1;3B <C-o><Esc>[1;3B
imap <Esc>[1;3D <C-o><Esc>[1;3D
imap <Esc>[1;3C <C-o><Esc>[1;3C
imap <Esc>. <C-o><Esc>.
imap <Esc>, <C-o><Esc>,
imap <Esc>; <C-o><Esc>;
imap <Esc>' <C-o><Esc>'
imap <Esc>= <C-o><Esc>=
imap <Esc>t <C-o><Esc>t
imap <Esc>x <C-o><Esc>x
imap <Esc>[ <C-o><Esc>[
imap <Esc>] <C-o><Esc>]

set splitbelow
set splitright

set mousefocus

let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

let g:airline#extensions#tabline#enabled = 1

nmap <C-m> :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <C-t> :tabnew<CR>
nmap <C-w> :tabclose<CR> 
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-]> :+tabmove<CR>
nmap <C-[> :-tabmove<CR>

imap <C-t> <C-o><C-t>
imap <C-w> <C-o><C-t>
imap <C-Left> <C-o><C-Left>
imap <C-Right> <C-o><C-Right>
imap <C-]> <C-o><C-]>
imap <C-[> <C-o><C-[>
