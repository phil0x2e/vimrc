# My vimrc for neovim
Just clone and link to ~/.vimrc:

```
$ ln -sr vimrc ~/.vimrc
```

Install vim-plug for neovim with:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then in vim to install Plugins:
```
:PlugInstall
```

To install YouCompleteMe run
```
cd ~/.vim/plugged/YouCompleteMe && python3 install.py --all
```


## Requirements
- On Manjaro/arch install **awesome-terminal-fonts** or **powerline-fonts**
- Also install: **ttf-freefont ttf-liberation ttf-droid**

