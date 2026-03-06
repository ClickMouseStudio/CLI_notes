# Conda 動作確認 (macOS)

このページでは、Conda が使えるかを確認します。  
最後にテスト用の環境を作って、Python の `Hello World` を実行します。

## 1. conda が使えるか確認
```bash
conda --version
```

`conda: command not found` の場合:
```bash
eval "$(/opt/homebrew/Caskroom/miniforge/base/bin/conda shell.zsh hook)"
```

## 2. conda を有効化
最初の1回だけ実行:
```bash
conda init zsh
source ~/.zshrc
```

## 3. チャンネル設定（Apple を追加 / conda-forge を優先）
```bash
conda config --add channels apple
conda config --add channels conda-forge
conda config --prepend channels conda-forge
conda config --set channel_priority strict
conda config --remove channels defaults
```
`defaults` が未登録の場合、最後の行でエラー表示が出てもそのまま次へ進んで大丈夫です。

確認:
```bash
conda config --show channels
```

詳しい背景は [04_conda_license_guide.md](./04_conda_license_guide.md) を参照してください。

## 4. テスト環境を作成
```bash
conda create -n conda-test python=3.12 -y
conda activate conda-test
```

## 5. Hello World を実行
```bash
python -c 'print("Hello World")'
```

`Hello World` と表示されれば完了です。

## 6. 終了
```bash
conda deactivate
```
