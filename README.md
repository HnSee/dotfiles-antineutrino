<h1 align="center">
  Dotfiles: Antineutrino
</h1>

<h4 align="center">Dotfiles for one of my personal setups.</h4>

## 🏗️ Installation
I use [yadm](https://github.com/TheLocehiliosan/yadm) for managing the dotfiles in this repository. Other methods may work, including a bare Git repository, but may not be very convenient. Besides that yadm does not overwrite your files if they differ and [asks you to resolve conflicts](https://yadm.io/docs/getting_started).

1. [Install](https://yadm.io/docs/install) yadm
2. [Clone](https://yadm.io/docs/getting_started) this repository via yadm:
```sh
yadm clone
```

This also installs utility scripts I wrote (see [below](#-included-scripts)) into the `bin` directory.

## 📜 Included Scripts
I wrote some utility scripts which are supposed to make some things easier and faster. They can be found in the `bin` directory.

- `dev-env`
  - I use [Nix](https://nixos.org/) for development environments. These are realized using [Flakes](https://nixos.wiki/wiki/Flakes). Entering those environments using `nix develop <path>` can be a bit tedious sometimes. This script simplifies this process using [fzf](https://github.com/junegunn/fzf).
- `_generate_nvim_plugins.sh`
  - This script generates a Markdown-formatted list of Neovim plugins from a given Neovim configuration file. Highly experimental.

## 🛠️ Tools
*This list may be outdated*

- Terminal Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Shell: [Zsh](https://www.zsh.org/)
  - Plugin manager: [zinit](https://github.com/zdharma-continuum/zinit)
  - Theme: `Oxide` by [dikiaap](https://github.com/dikiaap/dotfiles/blob/master/.oh-my-zsh/themes/oxide.zsh-theme)
  - Plugins:
    - [Oh My Zsh](https://ohmyz.sh/) (various plugins, completion, ...)
    - [zoxide](https://github.com/ajeetdsouza/zoxide)
- Application/Development management: [Nix](https://nixos.org/)
- Editor: [Neovim](https://neovim.io/)
  - Package manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
  - Plugins (May be outdated):
    - [Bufferline](https://github.com/akinsho/bufferline.nvim)
    - [Friendly Snippets](https://github.com/rafamadriz/friendly-snippets)
    - [Hop](https://github.com/phaazon/hop.nvim)
    - [Comment.nvim](https://github.com/numToStr/Comment.nvim)
    - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    - [Mason](https://github.com/williamboman/mason.nvim)
    - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
    - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
    - [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
    - [Nvim Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
    - [alpha-nvim](https://github.com/goolord/alpha-nvim)
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
    - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
    - [cmp-path](https://github.com/hrsh7th/cmp-path)
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
    - [lspkind-nvim](https://github.com/onsails/lspkind.nvim)
    - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    - [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - [nvim-surround](https://github.com/kylechui/nvim-surround)
    - [oxocarbon.nvim](https://github.com/nyoom-engineering/oxocarbon.nvim)
    - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    - [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
    - [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [💥 Which Key](https://github.com/folke/which-key.nvim)
    - [💾 Persistence](https://github.com/folke/persistence.nvim)
    - [🚦 Trouble](https://github.com/folke/trouble.nvim)

## 🔭 Plans
I have some plans configuring new and old applications. If I configure applications matching this setup I will include the respective dotfiles in here.

### Possible Future Applications
- [Eww](https://github.com/elkowar/eww)
- ...
