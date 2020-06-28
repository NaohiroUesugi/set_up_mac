# macの初期設定

## マウスの感度を早める。(10で使っている)
`defaults write -g com.apple.mouse.scaling 10`

## anyenvのインストール
`brew install anyenv`

`anyenv install --init`

`.bash_profile`に追加
```
export PATH="/usr/local/bin:$PATH"
eval "$(anyenv init -)"
```

`anyenv install --update`

### anyenv update`
https://github.com/znz/anyenv-update

`plagin`ディレクトリを作成。
`mkdir -p $(anyenv root)/plugins`

`git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update`

`anyenv update`
