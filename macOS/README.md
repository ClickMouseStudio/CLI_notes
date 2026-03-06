# macOS ディレクトリについて

このディレクトリは、Apple Silicon 搭載の macOS 環境における CLI 作業を快適に行うための
**シェル環境（Zsh）と Python 実行環境Miniforge**の整備手順と設定例をまとめたものです。

Zsh のカスタマイズから、Miniforge を使った Python 環境構築まで、
CLI 作業に必要な内容をできるだけわかりやすく整理していきます。

---

## 📁 構成

* [README.md](./README.md) — このファイル
* [macOS_install_list.md](./macOS_install_list.md) — 事前インストール項目（Homebrew Formulae / Casks）
* [zshrc\_setup.md](./zshrc_setup.md) — Zsh + Zinit の構成と設定内容
* [python\_env\_miniforge.md](./python_env_miniforge.md) — Miniforge による Python 環境構築手順
* [.zshrc](./.zshrc) — 実際の設定例（参考用）

---

## 🧭 対象環境

* macOS (Apple Silicon)
* ターミナル操作（主に iTerm2）
* パッケージ管理は Homebrew
* Python ディストリビューションは Miniforge3（Conda 系）

---

## 🧑‍💻 対象者

* macOS 上でターミナル作業を始めたい人
* Zsh の設定を軽く整えておきたい人
* Conda ベースで Python 環境を使いたい人
* CLI 作業環境を共通化・再利用したいチームや開発者

---

## ✅ はじめに（この順番でOK）

1. [macOS_install_list.md](./macOS_install_list.md) で Homebrew と必要アプリを入れる  
2. [zshrc_setup.md](./zshrc_setup.md) で `.zshrc` を反映する  
3. [python_env_miniforge.md](./python_env_miniforge.md) で Python 環境を作る

---

> 「黒い画面」をもっと使いやすく、自分好みに。
> その一歩を、ここから始めてみてください。
