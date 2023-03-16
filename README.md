<!-- ☄️  Heading {{{ -->
<h1 align="center">
   ☄️ vagari.nvim ☄️
</h1>

<p align="center">
<a href="https://github.com/nosvagor/vagari.nvim/discussions">
    <img
        src="https://img.shields.io/github/discussions/nosvagor/vagari.nvim?color=7492ef&logo=github&labelColor=222536&logoColor=4a6be3&style=for-the-badge"
        title="alright then, keep your secrets"
    >
</a>
&nbsp;
<a href="https://github.com/nosvagor/vagari.nvim/network/members">
    <img
        src="https://img.shields.io/github/forks/nosvagor/vagari.nvim?color=a188df&logo=git&labelColor=222536&logoColor=7f61cd&style=for-the-badge"
        title="I am tormented with an everlasting itch for things remote. I love to sail forbidden seas, and land on barbarous coasts."
    >
</a>
&nbsp;
<a href="https://github.com/nosvagor/vagari.nvim/contributors">
    <img
        src="https://img.shields.io/github/contributors/nosvagor/vagari.nvim?color=85ba6d&logo=gitea&labelColor=222536&logoColor=48a95b&style=for-the-badge"
        title="gotta do the cooking by the book"
    >
</a>
&nbsp;
<a href="https://github.com/nosvagor/vagari.nvim/issues">
    <img
        src="https://img.shields.io/github/issues/nosvagor/vagari.nvim?color=f8b486&logo=fireship&labelColor=222536&logoColor=ea834b&style=for-the-badge"
        title="this is not fine!!"
    >
</a>
</p>

<hr>
<blockquote>
    <img src="https://img.shields.io/static/v1?color=aeb9f8&logo=neovim&labelColor=222536&logoColor=aeb9f8&style=flat&message=βeta (0.4)&label=vagari.nvim"><br>
    &emsp;&emsp;&emsp;&rarr; a port of the <a href="https://github.com/nosvagor/vagari"><i>vagari</i></a> color
    scheme for <a href="https://github.com/neovim/neovim#--documentation-chat">neovim</a>,
    written in <b>lua</b>, and heavily influenced by <a href="https://github.com/nvim-treesitter/nvim-treesitter#nvim-treesitter">treesitter</a>.
</blockquote>
<!-- }}} --->
<hr>
<br>

## Basic Usage

> **Note** requires [treesitter 0.8+](https://github.com/nvim-treesitter/nvim-treesitter)

Install using `packer`

```lua
use { "nosvagor/vagari.nvim" }
```
Inside `init.lua`

```lua
vim.cmd(colorscheme vagari)
```
Or manually, while in neovim

```vim
:colorscheme vagari
```

<br>


## Configuration

Customized settings for vagari are not supported, <i>yet</i>. The color scheme
needs to mature before premature abstraction limits backwards
compatibility. For now, a strong default is being explored and developed.

In the meantime, I suggest forking the color scheme and editing settings you'd
prefer to change. Consider a pull request after you're done editing, perhaps
your idea is a better for the default settings!

- Extend or modify the palette here: [palette.lua](https://github.com/nosvagor/vagari.nvim/blob/main/lua/vagari/palette.lua)
- [thalamus.lua](https://github.com/nosvagor/vagari.nvim/blob/main/lua/vagari/thalamus.lua)
  is an attempt to route all color assignments to a standardized location, instead of links.
    > The goal is to bring clarity to the semantic mappings behind color choices,
    > and make the colors scheme more adaptable across contexts, plugins, and eventually applications.
- Direct changes to groups can be done here: [highlights.lua](https://github.com/nosvagor/vagari.nvim/blob/main/lua/vagari/highlights.lua)
    > Changes to particular file types can be done under treesitter_queries. <br>
    > Changes to plugins are also found in this file; [treesitter playground](https://github.com/nvim-treesitter/playground#neovim-treesitter-playground) is highly recommended.

In the future, the ability to simply override options will be supplied, once
various integrations mature.

<br>

## Integrations

<details>
    <summary>
       <a href="https://github.com/nvim-lualine/lualine.nvim#lualinenvim">lualine.nvim</a>
    </summary>
</details>

```lua
require('lualine').setup {
    options = {
        theme = "catppuccin"
        -- ... the rest of your lualine config
    }
}

-- or

local p = require("vagari.palette")
require('lualine').setup {

    }

```

<h2>
 🌈 Inspiration
</h2>

<p align="center">
    &emsp;&emsp;<a href="https://github.com/catppuccin/catppuccin"><strong>🥇 Catppuccin 🥇</strong></a>
    <br>
    <a href="https://github.com/folke/tokyonight.nvim">Tokyo Night</a>&nbsp;🥈&nbsp;
    <img src="https://github.com/nosvagor/vagari/blob/main/share/gifs/inspiration.gif?raw=true"
        title="nothing is original" width=30%>
    🥉 <a href="https://github.com/ellisonleao/gruvbox.nvim">Gruvbox</a>
</p>
<p align="right">
    <em>worthy mentions</em>:
    <a href="https://github.com/navarasu/onedark.nvim">Onedark</a>,
    <a href="https://cocopon.github.io/iceberg.vim/">Iceberg</a>,
    <a href="https://www.nordtheme.com/">Nord</a>,
    <a href="https://ethanschoonover.com/solarized/">Solarized</a>
</p>
<p align="center">
    &emsp;&emsp;
    <a href="https://github.com/nosvagor/vagari.nvim/stargazers">
        <img
            src="https://img.shields.io/github/stars/nosvagor/vagari.nvim?color=f5c069&logo=apachespark&labelColor=222536&logoColor=f5b855&style=for-the-badge"
            title="what is love, baby don't hurt me"
        >
    </a>
</p>
