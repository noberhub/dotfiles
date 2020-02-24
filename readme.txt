dotfilesをDropboxで共有

初期設定
・Dropboxディレクトリの中にdotfilesディレクトリを作成
・共有する実体ファイルを全てDropbox/dotfilesへ移動、もしくはコピー
 （zsh関連はprezto/runcomsディレクトリあるのでコピーの方がいいかも。
  また、prezto内にあるzsh関連のファイルはドットが外れてるので、
  ファイル名の先頭に'.'を付ける事）

・sh dotfilesLink.sh を実行してシンボリックリンクを~/に作成
・シンボリックリンクが設定されているか全て確認
  la ~/.vimrc のコマンドで確認できる

他端末での設定
・Dropboxをインストール
・・sh dotfilesLink.sh を実行してシンボリックリンクを~/に作成
・シンボリックリンクが設定されているか全て確認
  la ~/.vimrc のコマンドで確認できる

============================================================
以下のファイルの本来の場所（それぞれ~/にシンボリックリンクが配置）

.vim
~/.vim

zshrc
~/.zprezto/runcoms/zshrc

zpreztorc
~/.zprezto/runcoms/zpreztorc

zprofile
~/.zprezto/runcoms/zprofile

zshenv
~/.zprezto/runcoms/zshenv

============================================================
zshシェルのフレームワークPreztoをインストールしている為、zsh関連のファイルはpreztoのruncomsディレクトリにあるので、これをコピーして~/dropbox/dotfiles/ディレクトリ に配置し、これのシンボリックリンクを~/ディレクトリ に作成する



============================================================
以下はトラブったっときの参考用に

シンボリックリンクを作成するスクリプトを作成する。
# cd ~/dotfiles
# touch dotfileslink.sh			からファイルを作成
# chmod +x dotfileslink.sh		ファイルにパーミッション設定
# vim dotfileslink.sh			エディタで編集

