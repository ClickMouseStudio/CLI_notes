## ⚙️ LazyVim の設定

### LazyVim を使う

まずは、LazyVim のスターターテンプレートをクローンします：

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

その後、Neovim を起動します：

```bash
nvim
```

---

### カラースキームを設定する

ここでは、筆者が普段使用しているお気に入りのカラースキーム「solarized-osaka」を例に紹介します。とても見やすく落ち着いた配色で、ターミナルでの作業が快適になります。

> 📎 カラースキームの出典：[craftzdog/solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim)
> Apache-2.0 ライセンスで提供されています。利用や再配布の際は、必ずライセンスに従ってください。

#### 1. プラグインを追加

次のファイルを開きます：

```bash
~/.config/nvim/lua/plugins/colorscheme.lua
```

以下を追記します：

```lua
return {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
        return {
            transparent = true,
        }
    end,
}
```

#### 2. LazyVim 側でカラースキームを適用

次のファイルを開きます：

```bash
~/.config/nvim/lua/config/lazy.lua
```

`require(...)` の `spec` 配列内、`"add LazyVim and import its plugins"` の行を次のように変更します：

```lua
-- add LazyVim and import its plugins
{ "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
  colorscheme = "solarized-osaka",
} },
```

> 実際に筆者が使用している `lazy.lua` の例は、[lazy.lua](./lazy.lua) を参考にしてください。

---

これで、次回 `nvim` を起動するとカラースキームが反映されます。

> LazyVim を使えば、見た目も使い勝手も整った Neovim 環境がすぐに手に入ります。
> 最低限の設定だけでも、快適に作業できるエディタになります。
