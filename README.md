# macの初期設定

## マウスの感度を早める。(10で使っている)
`defaults write -g com.apple.mouse.scaling 10`

## Homebrew
`https://brew.sh/index_ja`

## anyenvのインストール
```
brew install anyenv
anyenv install --init
```

`.bash_profile`に追加
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

## yarn
`brew install yarn`
