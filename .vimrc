"------------------------------------------------------
" Vundle 設定 （プラグインマネージャー）
"------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'         "default Plugin
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'          "ステータスライン
Plugin 'ntpeters/vim-better-whitespace' "空白可視化
Plugin 'simeji/winresizer'				"ウィンドウリサイズ
Plugin 'reireias/vim-cheatsheet'		"チートシートを別ペインで
Plugin 'tpope/vim-fugitive'             "vim上でgit操作
"Plugin 'glidente/memolist.vim'			"シンプルなメモ管理
Plugin 'vim-jp/vimdoc-ja'				"vimヘルプの日本語版

call vundle#end()
filetype plugin indent on


" プラグインのインストール
" ・Vimを開いた状態で、以下を入力してEnter
" :PluginInstall
" ・ターミナル上で以下のコマンドを実行
" $ vim +PluginInstall +qall
"
" Vundleでプラグインをアップデート
" :PluginUpdate
"
" Vundleでプラグインをアンインストール
" プラグインの記述を削除、またはコメントアウトし、
" 次のコマンドを実行
" :PluginClean

"------------------------------------------------------
" 基本的な設定
"------------------------------------------------------

set encoding=utf-8      "vim内の文字コードをUTF-8に設定
scriptencoding utf-8    "vim scriptで日本語を使用
set clipboard+=unnamed	"ヤンク、クリップボード連携

inoremap <silent> jj <ESC>		"jjでノーマルモードへ
inoremap <silent> っj <ESC>		"日本語入力対応版 jj

"set visualbell					"ビープ音を可視化
set visualbell t_vb=           "ビープ音を止めて、可視化もしない
"set visualbell t_vb=           "ビープ音の全停止
"set noerrorbells

set nocompatible   "viとの互換性を取らない（vimの独自拡張を使う為）
set fileformats=unix,dos,mac	"改行コードの自動認識
set backspace=indent,eol,start	"バックスペースで削除できるものを指定
set scrolloff=3					"上下3行の視界を確保
set ttimeoutlen=50		"挿入モードからノーマルモードへの遅延解消

"vimの自動改行を無効にする
autocmd FileType text setlocal textwidth=0

set wrap	"ウィンドウ幅より長い行は折り返して、次の行に続けて表示
set hidden		"バッファが編集中でもその他のファイルを開けるように
set virtualedit=onemore	"行末の１文字先までカーソルを移動できるように
set helplang=ja

"------------------------------------------------------
" 表示設定
"------------------------------------------------------
set number              "行番号を表示する
set laststatus=2        "常にステータスラインを表示
syntax enable

set background=dark

set hlsearch		"検索語をハイライト表示
set showcmd			"入力中のコマンドをステータス右に表示する

"set helpheight=999     "ヘルプを画面いっぱいに開く

colorscheme molokai		"エディタカラースキーム

"molokai用設定
let g:molokai_original = 1
let g:rehash256 = 1

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"lightline.vim用設定
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" 256色サポート
if !has('gui_running')
  set t_Co=256
endif

"行番号のハイライト設定（以下3行でセット）
hi CursorLineNr ctermbg=NONE ctermfg=4     "行番号に色を付ける
set cursorline
hi clear CursorLine                  "カーソルラインを消す

"iTerm2側透過時のVim Powrlineの色不具合対策
highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE
highlight! SignColumn ctermbg=none guibg=NONE
highlight! VertSplit ctermbg=none guibg=NONE

"morokaiのカラーを変更
highlight! Comment ctermfg=244
highlight! Visual  ctermbg=195

"------------------------------------------------------
" 検索設定
"------------------------------------------------------
set incsearch   "検索ワードの最初の文字を入力した時点で検索を開始
set ignorecase  "大文字/小文字の区別なく検索する
set smartcase   "小文字のみで検索したときに大文字小文字を無視する
set hlsearch    "検索結果をハイライトする

"------------------------------------------------------
"インデント設定
"------------------------------------------------------
set smartindent     "オートインデント
set tabstop=4       "タブのスペース数
set shiftwidth=4	"vimの読み込み時などのタブ幅
set noexpandtab		"タブを挿入するとき、代わりに空白を使わない

"------------------------------------------------------
"バックアップ関係
"------------------------------------------------------
set backup						"バックアップファイルを作成
set backupdir=~/.vim/backup		"バックアップファイルの保存場所
set undodir=~/.vim/undo			"undoファイルを一箇所に
set directory=~/.vim/tmp        "スワップファイルを一箇所に
"（undoとtmpディレクトリは作成しておく）

"------------------------------------------------------
"その他
"------------------------------------------------------
"vimgrepした時に自動的にquickfix-windowを開くようにする
"autocmd QuickFixCmdPost vimgrep cwindow

nnoremap j gj	"折りたたまれた行内（論理行）を下移動できるようにする
nnoremap k gk	"折りたたまれた行内（論理行）を上移動できるようにする

"vimをサスペンドし、ターミナルへ（fgでvimへ戻る）
nnoremap <Space>zz <C-z>

"GUI Vimのみ
"nnoremap <silent><Space>]] :set columns=180<CR>	"Space+]] でウィンドウ横幅2倍"
"nnoremap <silent><Space>[[ :set columns=90<CR>	"Space+[[で横幅デフォルト(90)"

"------------------------------------------------------
"プラグイン設定
"------------------------------------------------------
"winresizer.vim用の設定
let g:winresizer_start_key='<C-@>'	"ウィンドウリサイズ開始
"let g:winresizer_gui_enable=1		"GUIでウィンドウ自体をリサイズする
let g:winresizer_vert_resize=2         "横リサイズの増減量
let g:winresizer_horiz_resize=1        "縦リサイズの増減量

"vim-cheatsheet用の設定
"let g:cheatsheet#cheat_file = 'チートファイル指定'
":Cheat で表示/非表示を切り替え
"dotfilesの準備が出来次第、パスを設定

"memolist.vim用の設定
map <Leader>mn  :MemoNew<CR>		"\mnで新規メモ
map <Leader>ml  :MemoList<CR>		"\mlでメモの一覧表示
map <Leader>mg  :MemoGrep<CR>		"\mgでメモの検索
"let g:memolist_path = "ディレクトリ指定"	"メモの保存先
let g:memolist_memo_suffix = "txt"		"テキスト形式

"======================================================
" シンタックスのハイライトグループ名とLink toを取得するスクリプト
" :SyntaxInfo コマンドが使用可能になる
"======================================================
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
