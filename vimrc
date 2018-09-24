" common
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent 
set cindent
set autowrite
set number
set nocompatible
set switchbuf=useopen,usetab
set hlsearch
set pastetoggle=<F2>
" set noswapfile
set directory=~/.vim/tmp,/tmp

" highlight the current line background
set cursorline

" display the cursor position on the bottom right corner
set ruler

" cmd alias name W to w
cnoreabbrev W w
" hot key to save and quit
nmap <C-F12> :wq<CR>

filetype plugin on
filetype indent on


" import modules
execute pathogen#infect('~/.vim/bundle/{}')
execute pathogen#infect('~/.vim/bundle/vix/bundle/{}')

" enable AutoSave on Vim startup
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" theme: monokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


" take NERDTree on/off
"autocmd vimenter * NERDTree
let NERDTreeWinSize=26
let NERDTreeWinPos='left'
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.so$']


" switch tabs
nmap <S-l> :tabn<CR>
nmap <S-h> :tabp<CR>
nmap <S-n> :tabnew<CR>


" easier window navigation
"Crtl+ww cycle though all windows
"Crtl+h takes you left a window
"Crtl+l takes you right a window
"Crtl+k takes you up a window
"Crtl+j takes you down a window
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j


" resize current window
nmap <A-left> :vertical resize -5<CR>
nmap <A-right> :vertical resize +5<CR>
nmap <A-up> :resize +2<CR>
nmap <A-down> :resize -2<CR>


" Tagbar
nmap <F8> :TagbarToggle<CR>


" highlight over length (120) lines with RED bg-color
highlight OverLength ctermbg=red ctermfg=white guibg=red
match OverLength /\%121v.\+/


" hot commands
" change default mapleader from '\' to ','
let mapleader = ","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)


" lightline bottom status bar
let g:lightline = {
    \ 'colorscheme': 'default',
    \ }

" auto jump to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


" clang-format
" autocmd FileType c,cpp ClangFormatAutoEnable

" python
" install: pip install --upgrade yapf
" project: https://github.com/google/yapf
let g:formatter_yapf_style = 'pep8'
" autocmd FileType python set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent fileformat=unix encoding=utf-8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent
    \ fileformat=unix
    \ encoding=utf-8

" auto format
" au FileType python,c,cpp :au BufWritePre * Autoformat
au FileType python,c,cpp nmap <F9> :Autoformat<CR>


" php
au FileType php nmap <F9> :PhpAutoformat<CR>

" web UI
au BufNewFile,BufRead *.js, *.css, *.html, *.htm, *.tpl
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

