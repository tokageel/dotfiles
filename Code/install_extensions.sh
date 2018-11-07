#!/bin/sh
# install_extensions.sh
#
# Visual Studio Codeの拡張機能をまとめてインストールするスクリプト.
# スクリプト実行前に、あらかじめcodeコマンドをインストールしておくこと.
# （（Command-Shift-P）-[Install 'code' command in PATH]）

##############################
# 設定

# code --list-extensionsの結果を格納したテキストへのパス
EXTENSION_LIST_PATH="./code-list-extensions.txt"

##############################
# 処理

# codeコマンド確認
code --version
result=$?
if [ ${result} -ne 0 ]
then
    echo "[ERROR] 'code' command is not available: code=${result}" 1>&2
    exit 1
fi

# 拡張機能リスト読み込み
target_extensions=$(cat $(dirname $0)/"${EXTENSION_LIST_PATH}")
result=$?
if [ ${result} -ne 0 ]
then
    echo "[ERROR] Error occured during reading an extensions list file" 1>&2
    exit 1
fi

# 拡張機能インストール
for extension_name in ${target_extensions}
do
    echo "[INFO] Install: " ${extension_name}
    code --install-extension ${extension_name}
done

exit 0
