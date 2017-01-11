# vix
vim environment


## install

``` shell
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone git@github.com:eryx/vix.git ~/.vim/bundle/vix
```


## run

1. vim -u ~/.vim/bundle/vix/vimrc
2. add `alias vix="vim -u ~/.vim/bundle/vix/vimrc"` to `~/.bashrc`


## The third party software of this product includes or reference

* pathogen.vim [https://github.com/tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
* nerd tree [https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* vim-go [https://github.com/fatih/vim-go](https://github.com/fatih/vim-go)
* go filetype plugin [https://github.com/google/vim-ft-go](https://github.com/google/vim-ft-go)
* molokai scheme [https://github.com/tomasr/molokai](https://github.com/tomasr/molokai)
* lightline [https://github.com/itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
* tagbar [https://github.com/majutsushi/tagbar](https://github.com/majutsushi/tagbar)

