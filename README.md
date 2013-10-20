This is my personal .vim directory.

## Setup

First clone this repository:

    git clone https://github.com/swatteau/dotvim ~/.vim

Install Vundle in the `bundle` directory:

    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle

Create a symbolic link to `vimrc`:

    ln -s ~/.vim/vimrc ~/.vimrc

Update all bundles inside Vim:

    :BundleUpdate

