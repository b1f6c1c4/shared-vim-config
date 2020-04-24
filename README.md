# Shared vim config

> Keep your `~/.vim` and `~/.vimrc` synchronized across different computers.

## Usage

1. Fork this repo.
1. Run the following on the computer that has the best `~/.vim` and `~/.vimrc`:

    ```bash
    git clone --depth=1 git@github.com:<your-github-username>/shared-vim-config.git ~/shared-vim-config
    rm -rf ~/shared-vim-config/.vim{,rc}
    mv ~/.vimrc ~/shared-vim-config/.vimrc
    mv ~/.vim ~/shared-vim-config/.vim
    ln -s ~/shared-vim-config/.vimrc ~/.vimrc
    ln -s ~/shared-vim-config/.vim ~/.vim
    cd ~/shared-vim-config
    git add .vimrc
    git commit
    git push -u origin master
    ```

1. Run the following on all other computers:

    ```bash
    git clone --depth=1 git@github.com:<your-github-username>/shared-vim-config.git ~/shared-vim-config
    mv ~/.vimrc ~/.vimrc.bak
    mv ~/.vim ~/.vim.bak
    ln -s ~/shared-vim-config/.vimrc ~/.vimrc
    ln -s ~/shared-vim-config/.vim ~/.vim
    ```

1. When you have modified your vimrc and you want to publish it everywhere,

    ```bash
    # On the computer where you modified your vim config
    cd ~/shared-vim-config
    git add .vimrc
    git commit
    git push -u origin master

    # On other computers
    cd ~/shared-vim-config
    git pull --ff-only
    ```

## Legal

WTFPL
