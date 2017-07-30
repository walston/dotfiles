set nocompatible
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set laststatus=2
set splitbelow
set splitright
set rnu
set nu

filetype off

"Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ycm_confirm_extra_conf = 0

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'     " Git changes in gutter
Plugin 'tpope/vim-fugitive'         " Git changes in gutter
Plugin 'scrooloose/nerdtree'        " Project Directory Tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'         " Fuzzy Search
Plugin 'mattn/emmet-vim'            " HTML shortcuts
Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'           " TypeScript
Plugin 'pangloss/vim-javascript'    " Syntax
Plugin 'w0rp/ale'                   " Linting
Plugin 'maksimr/vim-jsbeautify'     " Requires submodule updates
Plugin 'gko/vim-coloresque'         " Pigment style HiLite
Plugin 'zefei/vim-wintabs'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'Valloric/YouCompleteMe'
" This plugin requires compiling!!
" https://github.com/Valloric/YouCompleteMe#mac-os-x

call vundle#end()
filetype plugin indent on

syntax on
"Chrome Highlighting
hi LineNr ctermfg=LightGray ctermbg=Black cterm=none

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if has('statusline')
  hi StatusLineBufferNumber ctermbg=DarkGrey ctermfg=LightMagenta
  hi StatusLineFileName ctermbg=DarkGrey ctermfg=LightBlue
  hi StatusLineAuxData ctermbg=DarkGrey ctermfg=LightGreen
  set statusline=%#StatusLineBufferNumber#     " set highlighting
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%#StatusLineFileName#        " set highlighting
  set statusline+=%f\                          " file name
  set statusline+=%#StatusLineAuxData#         " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang},               " language of spelling checker
  set statusline+=%=                           " ident to the right
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=@%-7.(%l,%c%V%)\ %<%P        " cursor position/offset
  hi StatusLine ctermbg=Black
endif

" HotKeys
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-S-n> :NERDTreeFind<CR>
nmap <C-7> :res +5<CR> " increase pane by 2
nmap <C-8> :res -5<CR> " decrease pane by 2
nmap ( :vertical res -5<CR> " vertical increase pane by 2
nmap ) :vertical res +5<CR> " vertical decrease pane by 2
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }
