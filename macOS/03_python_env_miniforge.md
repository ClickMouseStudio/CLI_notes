# Conda 動作確認 (macOS)

このページでは、Conda が使えるかを確認します。  
最後にテスト用の環境を作って、Python の `Hello World` を実行します。

## 1. conda を有効化
最初の1回だけ実行:
```bash
conda init zsh
source ~/.zshrc
```

## 2. conda が使えるか確認
```bash
conda --version
```

`conda: command not found` の場合:
```bash
eval "$(/opt/homebrew/Caskroom/miniforge/base/bin/conda shell.zsh hook)"
```

## 3. テスト環境を作成
```bash
conda create -n conda-test python=3.12 -y
conda activate conda-test
```

## 4. Hello World を実行
```bash
python -c 'print("Hello World")'
```

`Hello World` と表示されれば完了です。

## 5. 終了
```bash
conda deactivate
```
