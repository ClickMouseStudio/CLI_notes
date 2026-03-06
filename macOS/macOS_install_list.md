# macOS 事前インストールガイド (Apple Silicon)

`.zshrc` を適用する前に、以下のパッケージを先に導入します。

## 方針
- CLI ツールは Homebrew で管理
- Zsh プラグインは Zinit で管理
- Conda は Miniforge (Homebrew Cask) を使用

## 1. Homebrew の更新
```bash
brew update
```

## 2. Formulae をインストール
```bash
brew install lsd fzf bat gh ghq curl gcc git neovim peco tree wget
```

## 3. Casks をインストール
フォント Cask のために `homebrew/cask-fonts` を先に追加します。
```bash
brew tap homebrew/cask-fonts
brew install --cask iterm2 font-fira-code font-fira-code-nerd-font font-hackgen font-hackgen-nerd miniforge
```

## 4. 導入確認
```bash
git --version
nvim --version
gh --version
fzf --version
conda --version
```

## 5. 次の手順
事前インストールが完了したら、以下へ進んでください。
- Zsh 設定: [zshrc_setup.md](./zshrc_setup.md)
- Python/Conda: [python_env_miniforge.md](./python_env_miniforge.md)
