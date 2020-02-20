#!/bin/sh

# sh dotfilesLink.sh で実行
#.vimrc と .gitconfig はリンク先のファイル名の後に/を付けないと、
#パーミッションの関係？でシンボリックリンクが作成されない
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc
