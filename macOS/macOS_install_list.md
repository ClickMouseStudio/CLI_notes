# macOS 事前インストールガイド (Apple Silicon)

このページでは、`.zshrc` を使う前に必要なアプリを入れます。  
「まず何をすればいいか」が分かるように、順番に書いています。

## 1. Homebrew をインストール（未導入の人だけ）
Homebrew は、アプリをコマンドで入れるための道具です。

ターミナルで次を実行:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

入ったか確認:
```bash
brew --version
```

## 2. Homebrew を最新にする
```bash
brew update
```

## 3. 基本ツールをインストール
```bash
brew install lsd fzf bat gh ghq curl gcc git neovim peco tree wget
```

## 4. 追加アプリをインストール（iTerm2 / フォント / Miniforge）
```bash
brew tap homebrew/cask-fonts
brew install --cask iterm2 font-fira-code font-fira-code-nerd-font font-hackgen font-hackgen-nerd miniforge
```

## 5. インストールできたか確認
```bash
git --version
nvim --version
gh --version
fzf --version
conda --version
```

## 6. 次の手順
ここまで終わったら、次へ進みます。
- Zsh の設定: [zshrc_setup.md](./zshrc_setup.md)
- Python の設定: [python_env_miniforge.md](./python_env_miniforge.md)
