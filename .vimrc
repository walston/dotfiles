set nocompatible
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set rnu
set nu

syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ycm_confirm_extra_conf = 0

Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'zefei/vim-wintabs'
Plugin 'Valloric/YouCompleteMe'
" This plugin requires compiling!!
" https://github.com/Valloric/YouCompleteMe#mac-os-x

call vundle#end()
filetype plugin indent on

highlight LineNr cterm=bold ctermfg=darkgrey

