# Windows / WSL CLI Setup Guide

Windows 11 + WSL2 を前提にした CLI 環境構築の最小手順です。

## 前提環境
- Windows 11
- 管理者権限
- Microsoft Store 利用可能

## WSL2 の導入
PowerShell (管理者) で実行:
```powershell
wsl --install
```
再起動後、Ubuntu を起動して初期ユーザーを作成します。

状態確認:
```powershell
wsl -l -v
```
`VERSION` が `2` であることを確認してください。

## Windows Terminal 設定
- 既定プロファイルを `Ubuntu` に設定
- フォントは Nerd Font 系を推奨
- コピー/ペーストを `Ctrl+Shift+C / Ctrl+Shift+V` に統一

## Git / SSH
WSL 側で設定します。
```bash
sudo apt update
sudo apt install -y git openssh-client
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## 改行コード注意（CRLF/LF）
WSL 側 Git は LF ベースを推奨:
```bash
git config --global core.autocrlf input
```

## 共通設定の参照
エディタ設定は [common/NeoVim](../common/NeoVim/) を参照してください。

## トラブルシュート
- `wsl --install` が失敗: Windows Update を適用後に再実行
- 実行権限エラー: `chmod +x <script>.sh`
- パス問題: まず WSL 内ホーム (`~`) にリポジトリを置く
