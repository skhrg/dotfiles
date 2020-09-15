" Basic stuff
set nocompatible
set history=50
set ruler
let mapleader = " "
set t_BE=
set t_RV=
set t_RB=
set t_RF=
set t_u7=

" Use pathogen
execute pathogen#infect()

" Colors
set t_Co=256
colorscheme gruvbox
syntax enable
set background=dark
let g:gruvbox_italic=1

" Enable filetype stuff
filetype on
filetype indent on
filetype plugin on

" Visualize things better
set hlsearch
set nu
set showmatch
set showmode

" Wildcard stuff
set wildchar=<TAB>
set wildmenu

" Indentation stuff
set autoindent
set copyindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Map arrows to always work
map <ESC>Od <C-Left>
map <ESC>Oc <C-Right>
map <ESC>Oa <C-Up>
map <ESC>Ob <C-Down>

" Better silence that redraws
command -nargs=1 Silent
            \   execute 'silent ' . <q-args>
            \ | execute 'redraw!'

" Statusline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

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

" Nerdtree setup
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

" Tagbar
nmap <C-j> :TagbarToggle<CR>
imap <C-j> <C-o><C-j>

" Closing and saving
nmap <C-d> :w<CR>
nmap <C-e> :q<CR>

imap <C-d> <C-o><C-d>
imap <C-e> <C-o><C-e>

" Splits
set splitbelow
set splitright

nmap <silent> <Esc>v :sp<CR>
nmap <silent> <Esc>h :vsplit<CR>
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

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

nmap <F8> :SyntasticCheck<CR>
nmap <leader><F8> :Errors<CR>
nmap <leader><C-w> :lclose<CR>

" Tabs
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

" LaTeX settings
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CustomTemplateDirectory='~/Documents/Projects/TexTemplates'
nmap <C-Down> <Plug>IMAP_JumpForward
nmap <C-Up> <Plug>IMAP_JumpBack
imap <C-Down> <C-o><C-Down>
imap <C-Up> <C-o><C-Up>

" Spellcheck for files that I usually need it in
autocmd FileType markdown setlocal spell
autocmd FileType markdown set complete+=kspell
autocmd FileType text setlocal spell
autocmd FileType text set complete+=kspell
autocmd FileType tex setlocal spell
autocmd FileType tex set complete+=kspell
autocmd FileType mail setlocal spell
autocmd FileType mail set complete+=kspell

" PDF production stuff
command PDFtex Silent call Tex_CompileLatex()
command PDF Silent exec "!pandoc % -o %:r.pdf &"
command PDFview Silent exec "!zathura '%:r.pdf' &"
command PDFbeamer Silent exec "!pandoc -t beamer % -o %:r.pdf &"

nmap <C-p> :w<bar>:PDF<CR>
autocmd FileType tex nmap <C-p> :w<bar>:PDFtex<CR>
autocmd BufRead,BufNewFile *.bmd nmap <C-p> :w<bar>:PDFbeamer<CR>
autocmd BufRead,BufNewFile *.bmd set filetype=markdown
imap <C-p> <C-o><C-p>
nmap <leader><C-p> :PDFview<CR>
