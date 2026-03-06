# Conda ライセンスとチャンネル設定（初心者向け）

このページは、大学の研究活動で Conda を使うときに
「どこに気をつければよいか」をシンプルにまとめたものです。

## 先に結論
- `Miniforge + conda-forge` を使う運用なら、Anaconda の有料条件を避けやすいです。
- `defaults` チャンネルを混ぜると、Anaconda 側の利用条件の対象になる可能性があります。
- クリーンな Miniforge では、通常 `defaults` は最初から入っていません。

## このリポジトリの方針
- Miniforge を使う
- 主要チャンネルは `conda-forge`
- Apple Silicon 向けに `apple` チャンネルも追加
- `defaults` は使わない

## 使う前に確認すること
```bash
conda config --show channels
conda config --show-sources
```

理想は、`channels` に次が入っている状態です。
- `conda-forge`
- `apple`

`defaults` が入っていたら外します。

```bash
conda config --remove channels defaults
```

`defaults` が出る主な原因は、過去の `.condarc` 設定の引き継ぎです。

## よくある質問
### Q. 大学研究なら Anaconda は必ず有料？
必ずではありません。
ただし、組織条件や利用形態で扱いが変わるため、
迷う場合は学内ルール（情報システム部門など）を確認してください。

### Q. なぜ conda-forge を使うの？
Miniforge の標準が conda-forge で、
ライセンス上の運用も分かりやすくなるためです。

## 参考（公式）
- Anaconda Terms FAQ: https://www.anaconda.com/pricing/terms-of-service-faqs
- Academic Terms: https://www.anaconda.com/legal/terms/academic
- Non-Profit/Research Terms: https://www.anaconda.com/legal/terms/non-profit-research
- Miniforge: https://github.com/conda-forge/miniforge
- defaults からの移行: https://conda-forge.org/docs/user/transitioning_from_defaults/
