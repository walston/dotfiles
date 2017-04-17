set nocompatible
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set rnu
set nu

filetype off

"Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ycm_confirm_extra_conf = 0

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'zefei/vim-wintabs'
Plugin 'Valloric/YouCompleteMe'
" This plugin requires compiling!!
" https://github.com/Valloric/YouCompleteMe#mac-os-x

call vundle#end()
filetype plugin indent on

syntax on

"Chrome Highlighting
hi LineNr ctermfg=LightGray ctermbg=Black cterm=none

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

if has('statusline')
  set statusline=%#Statement#                  " set highlighting
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%#WarningMsg#                " set highlighting
  set statusline+=%f\                          " file name
  set statusline+=%#Question#                  " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang},               " language of spelling checker
  set statusline+=%{SyntaxItem()}              " syntax highlight group under cursor
  set statusline+=%=                           " ident to the right
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=%-7.(%l,%c%V%)\ %<%P         " cursor position/offset
endif

