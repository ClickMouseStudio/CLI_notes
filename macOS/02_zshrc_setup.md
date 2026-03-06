# Zsh + Zinit Setup (macOS)

Apple Silicon 向けの最小 Zsh セットアップ手順です。

## 前提
- macOS (Apple Silicon)
- [01_macOS_install_list.md](./01_macOS_install_list.md) を完了していること

## 1. Zinit の導入
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 2. `.zshrc` を反映
このリポジトリのサンプルをベースにする場合:
```bash
# まずリポジトリのルートに移動
cd ~/CLI_notes

# いまの設定がある場合だけバックアップ
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup

# このリポジトリの .zshrc をホームディレクトリにコピー
cp ./macOS/.zshrc ~/.zshrc

# 反映
source ~/.zshrc
```
`cp` は「ファイルをコピーする」コマンドです。  
この手順では、`./macOS/.zshrc` を `~/.zshrc` にコピーして、ターミナル設定として使います。

バックアップに戻したい場合:
```bash
cp ~/.zshrc.backup ~/.zshrc
source ~/.zshrc
```

## 3. この時点での見方（初心者向け）
ここまでで `.zshrc` の反映は完了しています。  
下の項目は「今後カスタマイズするときの目安」です。最初はそのままで問題ありません。

- `HISTSIZE` / `SAVEHIST`  
  コマンド履歴をどれだけ残すかの設定です。
- `setopt autocd`  
  `cd` を省略してディレクトリ移動できる設定です。
- `alias`  
  長いコマンドを短くするためのショートカットです。

## 4. 動作確認
```bash
echo $SHELL
zsh --version
rg --version
```

## よくある問題
- プラグインが読み込まれない: `~/.zinit` の存在確認後に `source ~/.zshrc`
- 補完が遅い: プラグイン数を減らし、重い補完を後回しにする

## 次の手順
Conda の確認は [03_python_env_miniforge.md](./03_python_env_miniforge.md) を実行してください。
