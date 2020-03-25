# My vimrc
Just clone and link to ~/.vimrc:

```
$ ln -sr vimrc ~/.vimrc
```

Install vundle with:
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then in vim to install Plugins:
```
:PluginInstall
```

To install YouCompleteMe Plugin make sure that "Python 3 provider" is installed in nvim, if you're not sure simply call `:checkhealth` inside of nvim and follow the instructions.
Then run:
```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

## Requirements
- On Manjaro/arch install **awesome-terminal-fonts** or **powerline-fonts**
- Also install: **ttf-freefont ttf-liberation ttf-droid**

