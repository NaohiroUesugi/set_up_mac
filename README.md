# macの初期設定

# アプリ関係
#### [Karabiner-Elements](https://karabiner-elements.pqrs.org/) (キーマッピングを変更。)
`~/.config/karabiner/karabiner.json`に記述。
#### [iterm2](https://www.iterm2.com/) (ターミナル)
- Hotkeyの設定。(Ctrl + space)
#### [chrome](https://www.google.co.jp/chrome/?brand=CHBD&gclid=CjwKCAjw_-D3BRBIEiwAjVMy7Nk6gogUSP6EgujmhI78KviN03E_XtkdjiU1gGjtYl_Dy9NPvwxfhRoCkbsQAvD_BwE&gclsrc=aw.ds) (ブラウザ)
#### [vscode](https://code.visualstudio.com/download) (エディタ)
#### [xcode] (インストールに時間かかる)
#### [clipy](https://clipy-app.com/) (クリップボード)
#### []()
# 本体設定
## Mac defalutsの設定
```
defaults write -g com.apple.mouse.scaling 10
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

## Homebrew
https://brew.sh/index_ja

## zshに変更
```
chsh -s /bin/zsh
echo $SHELL <- 確認
```
bashに戻す場合は
`chsh -s /bin/bash`
既に.bash_profileがある場合.bash_profileの設定をzshにコピー
`cat .bash_profile >> .zprofile`
.zshrcに以下を追加。(補完を強くしてくれる)
```
autoload -Uz compinit
compinit
```

## スクリーンショットの保存先を変更
```
cd Pictures
mkdir ScreenShots
defaults write com.apple.screencapture location ~/Pictures/ScreenShots
```

## anyenvのインストール
```
brew install anyenv
anyenv install --init
```

`.zprofile`に追加
```
export PATH="/usr/local/bin:$PATH"
eval "$(anyenv init -)"
```

`anyenv install --update`

### anyenv update
https://github.com/znz/anyenv-update

```
mkdir -p $(anyenv root)/plugins <- plaginディレクトリを作成。
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update
```

### rbenv
```
anyenv install rbenv
rbenv install 2.6.5 <- 好きなversion
rbenv versions <- 確認
rbenv global 2.6.5 <-全体で使う場合
cd プロジェクトへ移動
rbenv local 2.6.5 <- プロジェクトごとで使う場合。
```

### nodenv
```
anyenv install nodenv
nodenv install 10.16.0
nodenv versions
nodenv global 10.16.0
cd プロジェクトへ移動
nodenv local 10.16.0
```
##### nodenv: default-packages file not foundと出る場合
`touch $(nodenv root)/default-packages`

## yarn
`brew install yarn`

## fzf
`brew install fzf`

## ripgrep
`brew install ripgrep`
