# My vimrc can now be found in my [dotfiles repo](https://github.com/phil0x2e/dotfiles), therefore this repo gets archived

## My vimrc for neovim
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

To install auto completion support for rust run `:CocInstall coc-rls` for python `:CocInstall coc-python` etc.

### Requirements
- On Manjaro/arch install **awesome-terminal-fonts** or **powerline-fonts**
- Also install: **ttf-freefont ttf-liberation ttf-droid**

