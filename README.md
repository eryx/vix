# vix
vim environment


## install

``` shell
mkdir -p ~/.vim/autoload ~/.vim/bundle

git clone https://github.com/eryx/vix.git ~/.vim/bundle/vix
/bin/cp -rf ~/.vim/bundle/vix/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

echo -e '\nalias vix="vim -u ~/.vim/bundle/vix/vimrc"\n' >> ~/.bashrc
source ~/.bashrc
```


## use
``` shell
echo -e '#include <stdio.h>\n\nmain()\n{\n  printf("hello world");\n}\n' > main.c

vix main.c
```

## The third party software of this product includes or reference

* pathogen.vim [https://github.com/tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
* nerd tree [https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* vim-go [https://github.com/fatih/vim-go](https://github.com/fatih/vim-go)
* go filetype plugin [https://github.com/google/vim-ft-go](https://github.com/google/vim-ft-go)
* molokai scheme [https://github.com/tomasr/molokai](https://github.com/tomasr/molokai)
* lightline [https://github.com/itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
* tagbar [https://github.com/majutsushi/tagbar](https://github.com/majutsushi/tagbar)

