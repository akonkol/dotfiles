execute pathogen#infect()
set clipboard+=unnamed
set ignorecase
set hlsearch
set number
set ruler

set nocompatible
set laststatus=2
set encoding=utf-8
syntax on
filetype plugin indent on

autocmd FileType python call SetPythonOptions()
autocmd BufNewFile,BufRead *.aurora setf python

function SetPythonOptions()
     setlocal tabstop=2
     setlocal softtabstop=2
     setlocal shiftwidth=2
     setlocal smarttab
     setlocal expandtab
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }

if has("autocmd")
	  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	      \| exe "normal! g'\"" | endif
endif

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
