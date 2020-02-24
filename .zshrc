# -----------------------------
# 全般
# -----------------------------

# 日本語を使用
export LANG=ja_JP.UTF-8

# 256色表示サポート
export TERM=xterm-256color

# 色を使用出来るようにする
autoload -Uz colors
colors

# エディタをvimに設定
export EDITOR=vim

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# ビープ音を無効にする
setopt no_beep

# '#' 以降をコメントとして扱う
setopt interactive_comments

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# git のカラー表示
git config --global color.ui auto

# -----------------------------
# Alias
# -----------------------------

# lsコマンドエイリアス (ls --> ls -F)
alias ls='ls -F'

# -----------------------------
# 補完
# -----------------------------

# 補完時の色設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# -----------------------------
# ヒストリ
# -----------------------------

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space






#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
