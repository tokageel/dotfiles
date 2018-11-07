# dotfiles
My dot files.

## Emacs
Caskで管理する.

```
$ brew install cask 
$ cask install
```

リンク
* https://github.com/cask/cask
* https://cask.readthedocs.io/en/latest/index.html

## Visual Studio Code
拡張機能は一覧のみを履歴管理する.
code --list-extensionsの結果を[テキスト](./Code/code-list-extensions.txt)で記載している.
[Code/install_extensions.sh](./Code/install_extensions.sh)を実行すると、一覧に記載されている拡張機能をインストールする.

拡張機能のインストールにはcodeコマンドが必要となるため、あらかじめインストールしておくこと.
codeコマンドは、Visual Studio Codeから（Command-Shift-P）-[Install 'code' command in PATH]でインストールできる.

