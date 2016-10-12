" ------------------------------------------------------------------
" vundle config
" ------------------------------------------------------------------
set nocompatible
filetype off

if has('unix')
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
elseif has('win32') || has('win64')
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim
  call vundle#begin('$HOME/vimfiles/bundle/')
endif

Plugin 'Jocoo2015/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'powerline/powerline'

Plugin 'mattn/emmet-vim'

Plugin 'Lokaltog/vim-powerline'

Plugin 'trusktr/seti.vim'

Plugin 'tyrannicaltoucan/vim-deep-space'

Plugin 'kien/ctrlp.vim'

" ------------------------------------------------------------------
" vim snipmate
" ------------------------------------------------------------------
Plugin 'MarcWeber/vim-addon-mw-utils'

Plugin 'tomtom/tlib_vim'

Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'
" ------------------------------------------------------------------

call vundle#end()

filetype plugin indent on

set number
set relativenumber
set tabstop=2 expandtab
set shiftwidth=2

syntax on


" ------------------------------------------------------------------
" setup terminal for solarized colorscheme
" ------------------------------------------------------------------
if has('gui_running')
  set background=light
  set t_Co=256
else
  set t_Co=16
  set background=light
  let g:solarized_termcolors=16
  " powerline config
  set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
endif

" ------------------------------------------------------------------
" set colorscheme
" ------------------------------------------------------------------
colorscheme seti


" ------------------------------------------------------------------
" set font
" ------------------------------------------------------------------
if has('win32') || has('win64')
  set guifont=Consolas:h12
elseif has('unix')
  if has("gui_macvim")
    set guifont=Monaco:h22
  else
    set guifont=Courier\ 16
  endif
else
endif


" ------------------------------------------------------------------
" GUI config
" ------------------------------------------------------------------
set guioptions-=m " remove menu
set guioptions-=T " remove toolbar
set guioptions-=L " remove left scrollbar
set guioptions-=r " remove right scrollbar

set textwidth=80
set colorcolumn=+1


" ------------------------------------------------------------------
" general key mapping
" ------------------------------------------------------------------
no <down> ddp
no <up> ddkP
nmap <Tab> :tabnext<CR>
nmap <c-d> yyp  " copy current line
map <C-F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" ------------------------------------------------------------------
" autocommand for quick compile and run
" ------------------------------------------------------------------
autocmd BufNewFile,BufRead *.py nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>
autocmd BufNewFile,BufRead *.java nnoremap <buffer> <F9> :exec '!javac % && java %:r' shellescape(@%, 1)<CR>


" ------------------------------------------------------------------
" NERDTree config
" ------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ------------------------------------------------------------------
" highlight current line
" ------------------------------------------------------------------
set cursorline


" ------------------------------------------------------------------
" set statusline
" ------------------------------------------------------------------
set laststatus=2


" ------------------------------------------------------------------
" show whitespaces at the end of line
" ------------------------------------------------------------------
set list
set listchars=trail:+,tab:\ \ ,


" ------------------------------------------------------------------
" optimize backspace
" ------------------------------------------------------------------
set backspace=indent,eol,start


" ------------------------------------------------------------------
" set tags
" ------------------------------------------------------------------
set tags=tags;


" ------------------------------------------------------------------
" set CtrlP
" ------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
