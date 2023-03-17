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

Install using [packer](https://github.com/wbthomason/packer.nvim#packernvim)

```lua
use "nosvagor/vagari.nvim",

-- then inside init.lua
vim.cmd(colorscheme vagari)
```
Install using [lazy](https://github.com/folke/lazy.nvim#-lazynvim)

```lua
require("lazy").setup({
    {
        "nosvagor/vagari.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("vagari")
        end,
    },
    -- ...
```

Relevant treesitter setups:
```lua

require("nvim-treesitter.configs").setup({
    -- simmply install all parsers:
	-- ensure_installed = "all",

    -- or at least install some essential ones:
    ensure_installed = { "c", "lua", "vim", "help", "query", "comment" }, -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/parsers.lua

    -- ...

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

<details closed>
    <summary>
       <a href="https://github.com/nvim-lualine/lualine.nvim#lualinenvim">lualine.nvim</a>
    </summary>

```lua
require('lualine').setup {
    options = {
        theme = "vagari"
        -- ... the rest of your lualine config
    }
}
```

Or import edit the theme table directly
([lua/lualine/themes/vagari.lua](https://github.com/nosvagor/vagari.nvim/blob/main/lua/lualine/themes/vagari.lua)):
```lua
local p = require("vagari.palette")

local custom_vagari = {
	normal = {
		a = { bg = p.blu_2, fg = p.drk_0 },
		b = { fg = p.blu_2, bg = p.glc_1 },
		c = { fg = p.glc_4, bg = p.drk_0 },
	},
	insert = {
		a = { bg = p.grn_2, fg = p.drk_0 },
		b = { fg = p.grn_2, bg = p.glc_1 },
	},
	command = {
		a = { bg = p.orn_2, fg = p.drk_0 },
		b = { fg = p.orn_3, bg = p.glc_1 },
	},
	visual = {
		a = { bg = p.prp_2, fg = p.drk_0 },
		b = { fg = p.prp_2, bg = p.glc_1 },
	},
	replace = {
		a = { bg = p.emr_2, fg = p.drk_0 },
		b = { fg = p.emr_2, bg = p.glc_1 },
	},
	-- inactive = { -- TODO: (inactive color config not tested)
	-- 	a = {},
	-- 	b = {},
	-- 	c = {},
	-- },
}

require('lualine').setup {
    options = {
        theme = custom_vagari
        -- ... the rest of your lualine config
    }
}
```

Or, if you have custom modules, e.g.:

```lua
local p = require("vagari.palette")

local filename = {
    "filename",
    file_status = true,
    path = 0,
    icon = "",
    symbols = {
        modified = "🞊",
        readonly = "",
        unnamed = "名前?",
    },
    color = function()
        local mode_color = {
            n = p.blu_4,
            i = p.grn_4,
            v = p.prp_4,
            V = p.prp_4,
            c = p.orn_4,
            R = p.emr_4,
            s = p.cyn_4,
            S = p.cyn_4,
            [""] = p.prp_4,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
}

require('lualine').setup {
    -- ...
	sections = {
		lualine_a = { mode }, -- mode is customized in this example
		lualine_b = { branch, filename }, -- so is branch
    -- ...
}
```
</details>

<br>

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
