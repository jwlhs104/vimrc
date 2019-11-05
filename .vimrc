call plug#begin()
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'zxqfl/tabnine-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
call plug#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on
syntax on

" fugitive
set diffopt+=vertical

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

" Configuring Vim color scheme
set termguicolors
set background=dark
colorscheme solarized8

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

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :G<CR>
" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Snippet
nnoremap <Leader>v :-1read $HOME/.vim/snippet/verilog.v<CR>wi
nnoremap <Leader>V :-1read $HOME/.vim/snippet/template.vue<CR>jf"a
" autocomplete {} bracket
inoremap {<CR> {<CR>}<Esc>ko<Tab>

" autocomplete html tags
inoremap <C-h> ><Esc>Bi<<Esc>yW$p^f<a/<Esc>hi
inoremap <C-k> <CR><Esc>ko<Tab>

" remap <Esc>
inoremap jh <Esc>

" Fix mapping conflict with vim-vue
autocmd FileType vue inoremap <buffer> <C-k> <CR><Esc>ko
autocmd FileType vue inoremap <buffer> {<CR> {<CR>}<Esc>ko
	
" End of Mappings


" Make tag for tag jumping
command! MakeTags !ctags -R .

"CleverTab"
function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	elseif strpart( getline('.'), 1, col('.')-1 ) =~'('
		return "\<Right>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

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
