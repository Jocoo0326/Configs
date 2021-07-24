" ------------------------------------------------------------------
" Plug config
" ------------------------------------------------------------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'mattn/emmet-vim'

Plug 'trusktr/seti.vim'

Plug 'tyrannicaltoucan/vim-deep-space'

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

Plug 'tpope/vim-unimpaired'

Plug 'tommcdo/vim-exchange'

Plug 'terryma/vim-multiple-cursors'

Plug 'rhysd/vim-clang-format'

Plug 'neoclide/coc.nvim'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'sbdchd/neoformat'

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
" nnoremap <C-c> "*yiw
" vnoremap <C-c> "*y
" nnoremap <C-v> i<C-r>*<Esc>0
" inoremap <C-v> <C-r>*
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
" denite
" ------------------------------------------------------------------
let g:user_emmet_leader_key=','

" ------------------------------------------------------------------
" clang format
" ------------------------------------------------------------------
nnoremap <leader><leader> :ClangFormat<CR>
let g:clang_format#code_style  = 'Google'
autocmd FileType c,cpp,java ClangFormatAutoEnable
" let g:clang_format#auto_format = 1

" ------------------------------------------------------------------
" denite
" ------------------------------------------------------------------
call denite#custom#alias('source', 'file_rec', 'file/rec')
call denite#custom#var('file_rec', 'command',
      \['ag', '--follow', '-g', '', '--ignore', '.git'])
call denite#custom#var('grep', {
      \ 'command': ['ag'],
      \ 'default_opts': ['-i', '--vimgrep'],
      \ 'recursive_opts': [],
      \ 'pattern_opt': [],
      \ 'separator': ['--'],
      \ 'final_opts': [],
      \ })
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
  inoremap <silent><buffer> <C-j> <Esc>
        \:call denite#move_to_parent()<CR>
        \:call cursor(line('.')+1,0)<CR>
        \:call denite#move_to_filter()<CR>A
  inoremap <silent><buffer> <C-k> <Esc>
        \:call denite#move_to_parent()<CR>
        \:call cursor(line('.')-1,0)<CR>
        \:call denite#move_to_filter()<CR>A
endfunction
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'_' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction
call s:profile(s:denite_options)
map <silent> <C-p> :DeniteProjectDir -buffer-name=files -direction=top file_rec <CR>
map <silent> <C-b> :DeniteBufferDir -buffer-name=buffers -direction=top buffer <CR>
map <silent> <C-s> :Denite -buffer-name=grep -direction=top grep <CR>

" ------------------------------------------------------------------
" denite
" ------------------------------------------------------------------
autocmd BufWritePre *.vue,*.js,*.html,*.css,*.less,*.scss,*.ts Prettier
let g:prettier#autoformat_config_files = ['.prettierrc.json']

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" vnoremap <silent> <C-c> :call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>p
