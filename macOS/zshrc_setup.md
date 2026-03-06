# Zsh + Zinit Setup (macOS)

Apple Silicon 向けの最小 Zsh セットアップ手順です。

## 前提
- macOS (Apple Silicon)
- [macOS_install_list.md](./macOS_install_list.md) を完了していること

## 1. Zinit の導入
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 2. `.zshrc` を反映
このリポジトリのサンプルをベースにする場合:
```bash
cp ./macOS/.zshrc ~/.zshrc
source ~/.zshrc
```

## 3. 推奨設定（最小）
- `HISTSIZE` / `SAVEHIST` を増やす
- `setopt autocd` で移動を簡略化
- `alias` は短く、意味が明確なものだけ定義

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
Conda の確認は [python_env_miniforge.md](./python_env_miniforge.md) を実行してください。
