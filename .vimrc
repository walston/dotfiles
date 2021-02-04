set nocompatible
set nowrap
set nolinebreak
set expandtab
set splitbelow
set splitright
set rnu
set nu
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set foldmethod=marker
set foldlevel=5
set backspace=indent,eol,start
set laststatus=2
set colorcolumn=80,140
set textwidth=0
set wildmenu
set signcolumn=number
set path+=**

filetype on
syntax on

" Plugins ------------------------------------------------------------------{{{
call plug#begin()
Plug 'WolfgangMehner/c-support'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'beyondmarc/hlsl.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'

Plug 'walston/monokai-vim'
Plug 'walston/statusline'
Plug 'walston/ft-detect'
call plug#end()

" Call after because colorscheme is installed by VimPlug
set termguicolors
colorscheme monokai
" }}}

" Mappings ---------------------------------------------- {{{
nnoremap ,+ :vertical resize +5<CR> " increase pane by 2
nnoremap ,- :vertical resize -5<CR> " decrease pane by 2
nnoremap ++ :resize +5<CR>          " increase pane by 2 vertically
nnoremap -- :resize -5<CR>          " decrease pane by 2 vertically
nnoremap == <C-W><C-=>              " equalize panes
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" ** Debugging Vim
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ** File Management
autocmd! FileType fzf set laststatus=0 noshowmode noruler
noremap <C-F> :Rg<CR>
noremap <C-P> :call fzf#run(fzf#wrap({'source': 'git ls-tree'}))<CR>
noremap <C-\> :Explore<CR>

" AutoCommands ------------------------------------------ {{{
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }}}

" Netrw ----------------------------------------------- {{{
let g:netrw_liststyle = 3
" }}}

