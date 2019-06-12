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

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'mattn/emmet-vim'

Plugin 'w0ng/vim-hybrid'

Plugin 'trusktr/seti.vim'

Plugin 'tyrannicaltoucan/vim-deep-space'

Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'majutsushi/tagbar'

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'Raimondi/delimitMate'

" Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'aquach/vim-http-client'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'http://git.coding.net/xzpnuist/vim-translate-plugin.git'

Plugin 'godlygeek/tabular'

Plugin 'morhetz/gruvbox'

Plugin 'w0rp/ale'

Plugin 'tpope/vim-unimpaired'

Plugin 'tommcdo/vim-exchange'

call vundle#end()
" ------------------------------------------------------------------

function! Platform()
  if has('win32') || has('win64')
    return 'windows'
  else if has('unix')
    return 'unix'
  endif
endfunction

filetype plugin indent on

set number
set relativenumber
set tabstop=2 expandtab
set shiftwidth=2
set nohlsearch
syntax on


" ------------------------------------------------------------------
" setup terminal for solarized colorscheme
" ------------------------------------------------------------------
if has('gui_running')
  set background=light
  set t_Co=256
else
  set t_Co=16
  set background=dark
  let g:solarized_termcolors=16
  " powerline config
  set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
endif


" ------------------------------------------------------------------
" set colorscheme
" ------------------------------------------------------------------
colorscheme gruvbox
set bg=dark


" ------------------------------------------------------------------
" set airline theme
" ------------------------------------------------------------------
let g:airline_theme='gruvbox'


" ------------------------------------------------------------------
" set font
" ------------------------------------------------------------------
if has('win32') || has('win64')
  " set guifont=Consolas:h12
  " set guifont=YaHei\ Consolas\ Hybrid:h13
  set guifont=Fira\ Code:h12,YaHei\ Consolas\ Hybrid:h12
  " set guifont=Source\ Code\ Pro:h13
elseif has('unix')
  if has("gui_macvim")
    set guifont=Monaco:h20
  else
    set guifont=FiraCode\ 16
  endif
else
endif
set encoding=utf8


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
nmap <C-d> yyp  " copy current line
nnoremap <leader>ctags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <C-c> "*yiw
vnoremap <C-c> "*y
nnoremap <C-v> i<C-r>*<Esc>0
inoremap <C-v> <C-r>*
nnoremap <leader>vimrc :tabedit $MYVIMRC<CR>
nnoremap <leader>rl :source $MYVIMRC<CR>


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


" ------------------------------------------------------------------
" set nerdCommenter
" ------------------------------------------------------------------
let g:NERDSpaceDelims=1
map <C-_> <leader>c<Space>


" ------------------------------------------------------------------
" set tagbar
" ------------------------------------------------------------------
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>


" ------------------------------------------------------------------
" set rainbow_parenttheses
" ------------------------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ------------------------------------------------------------------
" set delimitMate
" ------------------------------------------------------------------
au FileType python let b:delimitMate_nesting_quotes = ['"']

" ------------------------------------------------------------------
" set ejs as html
" ------------------------------------------------------------------
au BufNewFile,BufRead *.ejs set filetype=html

" ------------------------------------------------------------------
" set ale formatter
" ------------------------------------------------------------------
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
