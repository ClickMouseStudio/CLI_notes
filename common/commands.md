# Common CLI Commands

OS に依存しにくい、日常運用向けコマンド集です。

## ファイル探索
```bash
rg --files
rg "TODO"
```

## Git 基本
```bash
git status
git add <path>
git commit -m "docs(scope): message"
git pull --rebase
```

## シェル作業
```bash
pwd
ls -lah
cd -
```

## NeoVim
```bash
nvim
nvim README.md
```

## 安全運用メモ
- 破壊的操作（`rm -rf`, `git reset --hard`）は実行前に対象を確認する
- コマンド例は自分の環境パスに置き換えてから実行する
