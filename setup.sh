#!/bin/bash
set -e

if ! command -v apt &> /dev/null; then
    echo "debian系以外は対応していません。"
    exit 1
fi

echo "gitが使えるか確認します。"
if ! command -v git &> /dev/null; then
    sudo apt update && sudo apt install -y git

    # インストールが成功したか確認
    if command -v git &> /dev/null; then
        echo "gitのインストールが完了しました。"
    else
        echo "エラー: gitのインストールに失敗しました。"
        exit 1
    fi
else
    echo "git OK"
fi

echo "githubからクローン"
cd ~
git clone https://github.com/Pikka2048/setup.sh
cd setup.sh
echo "クローン OK"

read -p "nvimの最新LTSをソースからビルドしますか？ (y/N): " CONFIRM

case "$CONFIRM" in
    [yY]*) 
        # y または Y で始まる入力の場合
        echo "処理を実行します..."
        # ここに実行したいコマンドを書く
        ;;
    *) 
        # それ以外（nやEnterのみなど）
        echo "キャンセルしました。"
        exit 1
        ;;
esac
