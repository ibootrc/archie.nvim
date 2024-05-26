Neovim theme based on the [poimandres neovim theme](https://github.com/olivercederborg/poimandres.nvim)
### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)
- [Leap](https://github.com/ggandor/leap.nvim)


## 📦 Installation
Install with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- Lua

{ 
    'ibootrc/archie.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('archie').setup {
                -- leave this setup function empty for default config
                    -- or refer to the configuration section
                    -- for configuration options
            }
    end,

        -- optionally set the colorscheme within lazy config
            init = function()
            vim.cmd("colorscheme archie")
            end
}
```
<details>
<summary>Install with packer:</summary>

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua

use { 
    'ibootrc/archie.nvim',
        config = function()
            require('archie').setup {
                -- leave this setup function empty for default config
                    -- or refer to the configuration section
                    -- for configuration options
            }
    end
}
```
</details>

<details>
<summary>Install with vim-plug:</summary>

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
" Vim Script

Plug 'ibootrc/archie.nvim'

lua << EOF
require('archie').setup {

}
EOF
```

</details>


## 🚀 Usage

**Enable the colorscheme**:

_**IMPORTANT!** The `setup` function has to be invoked before the colorscheme is set!_

```lua
-- Lua

vim.cmd('colorscheme archie')
```

```vim
" Vim Script

colorscheme archie
```

## ⚙️ Configuration:

**Setup function options**: 

```lua
require('archie').setup {
    bold_vert_split = false, -- use bold vertical separators
        dim_nc_background = false, -- dim 'non-current' window backgrounds
        disable_background = false, -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false, -- disable italics
}
```

To enable archie for `Lualine`, just set the theme in your Lualine configuration:

```lua
require('lualine').setup {
    options = {
        -- ... your lualine config
            theme = 'archie'
            -- ... your lualine config
    }
}
```

