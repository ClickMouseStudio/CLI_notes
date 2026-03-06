# Zsh + Zinit Setup (macOS)

Apple Silicon 向けの最小 Zsh セットアップ手順です。

## 前提
- macOS (Apple Silicon)
- Homebrew 導入済み

## 0. 事前インストール
先に [macOS_install_list.md](./macOS_install_list.md) の手順で必要ツールを入れてください。
最小実行コマンド:
```bash
brew update
brew install lsd fzf bat gh ghq curl gcc git neovim peco tree wget
brew tap homebrew/cask-fonts
brew install --cask iterm2 font-fira-code font-fira-code-nerd-font font-hackgen font-hackgen-nerd miniforge
```

## 1. 追加ツール導入（任意）
`macOS_install_list.md` で入れていない場合のみ実行:
```bash
brew install zsh ripgrep
```

## 2. Zinit の導入
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

## 3. `.zshrc` を反映
このリポジトリのサンプルをベースにする場合:
```bash
cp ./macOS/.zshrc ~/.zshrc
source ~/.zshrc
```

## 4. 推奨設定（最小）
- `HISTSIZE` / `SAVEHIST` を増やす
- `setopt autocd` で移動を簡略化
- `alias` は短く、意味が明確なものだけ定義

## 5. 動作確認
```bash
echo $SHELL
zsh --version
rg --version
```

## よくある問題
- プラグインが読み込まれない: `~/.zinit` の存在確認後に `source ~/.zshrc`
- 補完が遅い: プラグイン数を減らし、重い補完を後回しにする
