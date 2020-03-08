set nocompatible
set history=50
set ruler

execute pathogen#infect()

syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox 
let g:airline_theme='solarized'
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
set t_BE=

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
nmap <silent> <Esc><Up> :wincmd k<CR>
nmap <silent> <Esc><Down> :wincmd j<CR>
nmap <silent> <Esc><Left> :wincmd h<CR>
nmap <silent> <Esc><Right> :wincmd l<CR>
nmap <silent> <Esc>. :wincmd ><CR>
nmap <silent> <Esc>, :wincmd <<CR>
nmap <silent> <Esc>; :wincmd -<CR>
nmap <silent> <Esc>' :wincmd +<CR>
nmap <silent> <Esc>= :wincmd =<CR>
nmap <silent> <Esc>t :wincmd T<CR>
nmap <silent> <Esc>x :wincmd x<CR>
nmap <silent> <Esc>[ :wincmd R<CR>
nmap <silent> <Esc>] :wincmd r<CR>
nmap <silent> <leader><Esc><Up> :wincmd K<CR>
nmap <silent> <leader><Esc><Down> :wincmd J<CR>
nmap <silent> <leader><Esc><Left> :wincmd H<CR>
nmap <silent> <leader><Esc><Right> :wincmd L<CR>

imap <Esc>h <C-o><Esc>h
imap <Esc>v <C-o><Esc>v
imap <Esc>w <C-o><Esc>w
imap <Esc><Up> <C-o><Esc><Up>
imap <Esc><Down> <C-o><Esc><Down>
imap <Esc><Left> <C-o><Esc><Left>
imap <Esc><Right> <C-o><Esc><Right>
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

let g:syntastic_always_populate_loc_list = 0 
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0

nmap <F8> :SyntasticCheck<CR>
nmap <leader><F8> :Errors<CR>
nmap <leader><C-w> :lclose<CR>

map <ESC>Od <C-Left>
map <ESC>Oc <C-Right>
map <ESC>Oa <C-Up>
map <ESC>Ob <C-Down>

nmap <C-t> :tabnew<CR>
nmap <C-w> :tabclose<CR> 
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-]> :+tabmove<CR>
nmap <C-[> :-tabmove<CR>

imap <C-t> <C-o><C-t>
imap <C-w> <C-o><C-w>
imap <C-Left> <C-o><C-Left>
imap <C-Right> <C-o><C-Right>
imap <C-]> <C-o><C-]>
imap <C-[> <C-o><C-[>

nmap <C-d> :w<CR>
nmap <C-e> :q<CR>

imap <C-d> <C-o><C-d>
imap <C-e> <C-o><C-e>

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CustomTemplateDirectory='~/Documents/Projects/TexTemplates'
nmap <C-Down> <Plug>IMAP_JumpForward
nmap <C-Up> <Plug>IMAP_JumpBack
imap <C-Down> <C-o><C-Down> 
imap <C-Up> <C-o><C-Up>

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.txt set complete+=kspell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.tex set complete+=kspell

command -nargs=1 Silent
            \   execute 'silent ' . <q-args>
            \ | execute 'redraw!'

command TexPDF Silent call Tex_CompileLatex()
command PDF Silent exec "!pandoc % -o %:r.pdf &"

nmap <C-p> :w<CR>:PDF<CR>
autocmd FileType tex nmap <C-p> :w<CR>:TexPDF<CR>
imap <C-p> <C-o><C-p>
command PDFview Silent exec "!okular %:r.pdf &"
nmap <leader><C-p> :PDFview<CR>
