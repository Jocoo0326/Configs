" ------------------------------------------------------------------
" Plug config
" ------------------------------------------------------------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

Plug 'altercation/vim-colors-solarized'

" Plug 'scrooloose/nerdtree'

Plug 'mattn/emmet-vim'

Plug 'w0ng/vim-hybrid'

Plug 'trusktr/seti.vim'

Plug 'tyrannicaltoucan/vim-deep-space'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'majutsushi/tagbar'

Plug 'kien/rainbow_parentheses.vim'

Plug 'Raimondi/delimitMate'

" Plug 'Valloric/YouCompleteMe'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'aquach/vim-http-client'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Plug 'http://git.coding.net/xzpnuist/vim-translate-plugin.git'

Plug 'godlygeek/tabular'

Plug 'morhetz/gruvbox'

" Plug 'w0rp/ale'

Plug 'tpope/vim-unimpaired'

Plug 'tommcdo/vim-exchange'

Plug 'terryma/vim-multiple-cursors'

Plug 'rhysd/vim-clang-format'

Plug 'neoclide/coc.nvim'

call plug#end()
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
  " set guifont=Source\ Code\ Pro:h13
  set guifont=Fira\ Code:h12,YaHei\ Consolas\ Hybrid:h12
else
  " set guifont=Monaco:h20
  set guifont=FiraCode\ 13
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

set autoread


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
" map <C-S-n> :NERDTreeToggle<CR>
" autocmd bufenter * lf (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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
" let b:ale_fixers = ['prettier', 'eslint']
" let g:ale_fixers = {
      " \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      " \   'javascript': ['eslint'],
      " \}
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc
"

" ------------------------------------------------------------------
" set multiple cursors mapping
" ------------------------------------------------------------------
let g:multi_cursor_use_default_mapping=1
" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" ------------------------------------------------------------------
" clang format
" ------------------------------------------------------------------
nnoremap <leader><leader> :ClangFormat<CR>
let g:clang_format#code_style  = 'Google'
autocmd FileType c,cpp,java ClangFormatAutoEnable
" let g:clang_format#auto_format = 1
