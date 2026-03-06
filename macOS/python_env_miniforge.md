# Python Environment with Miniforge (macOS)

Miniforge を使って軽量に Python 環境を管理する手順です。

## 1. Miniforge の確認（未導入ならインストール）
まず確認:
```bash
conda --version
```

見つからない場合のみインストール:
```bash
brew install --cask miniforge
```

初期化:
```bash
conda init zsh
source ~/.zshrc
```

## 2. 環境作成
```bash
conda create -n cli-notes python=3.12 -y
conda activate cli-notes
```

## 3. 基本パッケージ
```bash
python -m pip install --upgrade pip
pip install ipython black ruff
```

## 4. 環境エクスポート
再現用ファイル作成:
```bash
conda env export --no-builds > environment.yml
```

復元:
```bash
conda env create -f environment.yml
```

## 5. 運用ルール
- プロジェクトごとに conda 環境を分離
- グローバル環境に直接 `pip install` しない
- 使い終わったら `conda deactivate`

## トラブルシュート
- `conda` が見つからない: `source ~/.zshrc` を再実行
- 依存競合: 新規環境を作り直して最小依存から追加
