call plug#begin()
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'zxqfl/tabnine-vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'triglav/vim-visual-increment'
Plug 'easymotion/vim-easymotion'
Plug 'wincent/command-t'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'luochen1990/rainbow'
call plug#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on
let g:python_highlight_all = 1
syntax on

" fugitive
set diffopt+=vertical

" bracket rainbow
let g:rainbow_active = 1
" conflict with devicons
let g:rainbow_conf = {
	\	'separately': {
	\		'nerdtree': 0,
	\	}
	\}
" fix vim-vue bug
autocmd FileType vue syntax sync fromstart

" autoopen NERDTree
autocmd vimenter * NERDTree 
autocmd vimenter * if argc() != 0 | wincmd w | endif
" close vim if only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" setup for airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" setup for emmet
let g:user_emmet_leader_key=','

" Configuring Vim color scheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
set t_Co=256
colorscheme gruvbox

" Setup code for Indentline
set conceallevel=1
let g:indentLine_setColors=239
let g:indentLine_char='--'
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel=2

" Mappings
let mapleader=","
set showcmd

" Tab navigation 
nnoremap <Leader>a :tabprev<CR>
nnoremap <Leader>d :tabnext<CR>
nnoremap <Leader>q :tabmove-1<CR>
nnoremap <Leader>e :tabmove+1<CR>

" resize split
nnoremap <Leader>= <C-w>=

" fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :G<CR>
" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Snippet
nnoremap <Leader>v :find ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
" autocomplete {} bracket
inoremap {<CR> {<CR>}<Esc>ko<Tab>

" autocomplete html tags
inoremap <C-h> ><Esc>Bi<<Esc>yW$p^f<a/<Esc>hi
inoremap <C-k> <CR><Esc>ko<Tab>

" remap <Esc>
inoremap jh <Esc>
" remap ;
nnoremap ; :
nnoremap <C-s> <C-]>

" Fix mapping conflict with vim-vue
autocmd FileType vue inoremap <buffer> <C-k> <CR><Esc>ko
autocmd FileType vue inoremap <buffer> {<CR> {<CR>}<Esc>ko
	
" End of Mappings


" Make tag for tag jumping
command! MakeTags !ctags -R .

" Turn on auto-indent
set ai
" Show existing tab with 4 spaces width
set tabstop=2
" When indenting with '>', use 4 spaces width
set shiftwidth=2
" Convert Tab to Space
set expandtab
" Display line numbers
set nu
" When using '/' to search, show result while searching
set incsearch
set smartcase
set hlsearch
set ignorecase
nnoremap <CR> :noh<cr>
" Enable cursorline color
set cursorline
" Enable backspace
set backspace=2
" Enable recursive :find 
set path+=**
" show all result for *<filename>
set wildmenu
" alias clipboard with vim
set clipboard=unnamed
" relative number
set relativenumber
" encoding
set encoding=utf-8

" folding
set foldmethod=indent
set foldnestmax=1
set foldclose=all
set wildignore+=*/node_modules/*

nnoremap rp :w<CR> :exe "!tmux send -t 1 'python %' Enter"<CR><CR>
