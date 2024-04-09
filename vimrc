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

let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

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
let NERDTreeWinSize=48
let NERDTreeWinPos='left'
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.so$']
let g:NERDTreeDirArrowExpandable  = get(g:, 'NERDTreeDirArrowExpandable',  '+')
let g:NERDTreeDirArrowCollapsible = get(g:, 'NERDTreeDirArrowCollapsible', '~')


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
"
let s:configfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=file'"
let s:noconfigfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=google'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"

" python via yapf
" install: pip install --upgrade yapf
" project: https://github.com/google/yapf
"" let g:formatter_yapf_style = 'pep8'
" autocmd FileType python set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent fileformat=unix encoding=utf-8
"" au BufNewFile,BufRead *.py
""     \ set tabstop=4
""     \ softtabstop=4
""     \ shiftwidth=4
""     \ expandtab
""     \ autoindent
""     \ fileformat=unix
""     \ encoding=utf-8

" python via black
" install: pip install --upgrade black
" project: https://github.com/psf/black
au FileType python nmap <F9> :Black<CR>

" auto format
" au FileType c,cpp,proto :au BufWritePre * Autoformat
au FileType c,cpp,proto,sql nmap <F9> :Autoformat<CR>

" vim-graphql
""  au BufNewFile,BufRead *.prisma setfiletype graphql


" vim-prettier
"  npm -g install prettier
let g:prettier#config#print_width = '100'
let g:prettier#config#tab_width = '4'
let g:prettier#config#use_tabs = 'false'
au FileType graphql,gql let b:prettier_exec_cmd = "prettier-stylelint"
au FileType graphql,gql nmap <F9> :Prettier<CR>
au FileType javascript nmap <F9> :Prettier<CR>
au FileType html nmap <F9> :Prettier<CR>
au FileType scss,css nmap <F9> :Prettier<CR>

" npm -g install js-beautify
""  let g:formatdef_jsbeautify_javascript = '"js-beautify -s 4 -w 120 -k --indent-empty-lines"'


" rust
let g:rustfmt_autosave = 1

" php
au FileType php nmap <F9> :PhpAutoformat<CR>

" toml
" install
"  cargo install taplo-cli --locked
" options
"  https://taplo.tamasfe.dev/configuration/formatter-options.html
fun! TomlFormatFile(path)
  silent! let l:status = system('taplo -h')
  if v:shell_error
    return 0
  endif

  let s:lint = system('taplo check '. a:path)
  if v:shell_error
    echohl Error | echo s:lint | echohl None
  else
    let s:output = system('taplo format '. a:path)
      if v:shell_error
        echohl Error | echo s:output | echohl None
      else
        exec 'edit!'
    endif
  endif
endfun
command! TomlFormat call TomlFormatFile(expand('%:p'))
au FileType toml nmap <F9> :TomlFormat <CR>

" web UI
" au BufNewFile,BufRead *.js, *.css, *.html, *.htm, *.tpl
"     \ set tabstop=2
"     \ softtabstop=2
"     \ shiftwidth=2

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
" LaTeX math
let g:vim_markdown_math = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1
" TOML Front Matter
let g:vim_markdown_toml_frontmatter = 1
" JSON Front Matter
let g:vim_markdown_json_frontmatter = 1
