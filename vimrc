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

filetype plugin on
filetype indent on

" modules
execute pathogen#infect('~/.vim/bundle/{}')
execute pathogen#infect('~/.vim/bundle/vix/bundle/{}')


" theme: monokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" take NERDTree on/off
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>

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


