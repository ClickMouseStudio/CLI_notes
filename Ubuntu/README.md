# Ubuntu CLI Setup Guide

Ubuntu 環境向けの最小 CLI セットアップ手順です。初学者でも再現しやすい順序で記載しています。

## 前提環境
- Ubuntu 22.04 以降
- `sudo` 権限のあるユーザー
- インターネット接続

## 初期セットアップ
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git unzip build-essential ripgrep fd-find
```

## 必須パッケージ
- `git`: ソース管理
- `ripgrep` (`rg`): 高速検索
- `build-essential`: 開発系ツール
- `unzip`, `curl`: 配布物展開と取得

確認コマンド:
```bash
git --version
rg --version
```

## シェル設定（bash / zsh）
Ubuntu 既定は bash です。zsh を使う場合:
```bash
sudo apt install -y zsh
chsh -s "$(which zsh)"
```

共通 alias は `~/.bashrc` または `~/.zshrc` に追加:
```bash
alias ll='ls -lah'
alias gs='git status'
alias ..='cd ..'
```

## NeoVim 利用
共通設定は [common/NeoVim](../common/NeoVim/) を参照してください。LazyVim を使う場合は該当手順に従ってください。

## トラブルシュート
- `rg` が見つからない: `sudo apt install -y ripgrep`
- zsh 変更後に反映されない: 端末を再起動して `echo $SHELL` を確認
- 文字化け: ターミナルの文字コードを UTF-8 に設定
