-- Package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Packages

require("lazy").setup({
  "folke/which-key.nvim",
  {
    "nyoom-engineering/oxocarbon.nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
          vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
          vim.cmd("highlight LineNr ctermbg=NONE guibg=NONE")
        end
      })
      vim.cmd([[colorscheme oxocarbon]])
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
      },
    },
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
      },
    },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = 'mm',
        block = 'mb',
      },
      opleader = {
        line = 'mj',
        block = 'mk',
      },
      extra = {
        above = 'mO',
        below = 'mo',
        eol = 'mA',
      },
    },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    config = true,
  },
  {
    "m4xshen/autoclose.nvim",
    config = true,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
  {
    "phaazon/hop.nvim",
    config = true,
    keys = {
      { "<leader>s", "<cmd>HopChar1<cr>", desc = "Hop anywhere" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          automatic_installation = false,
        },
        config = true,
      },
    },
    config = function()
      local on_attach = function(client, buffernr)
        local bufopts = { noremap = true, silent = true, buffer = buffernr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>e', vim.lsp.buf.format, bufopts)
      end

      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      require("lspconfig").rnix.setup({
        on_attach = on_attach,
      })

      require("lspconfig").zk.setup({})

      require("lspconfig").texlab.setup({})

      require("lspconfig").jsonls.setup({
        on_attach = on_attach,
      })

      require("lspconfig").cssls.setup({
        on_attach = on_attach,
      })

      require("lspconfig").clangd.setup({
        on_attach = on_attach,
      })

      require("lspconfig").typst_lsp.setup({
        on_attach = on_attach,
        settings = {
          exportPdf = "onSave"
        }
      })


      vim.diagnostic.config({ virtual_text = false })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "file_browser"
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                                 desc = "Find file" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                  desc = "Grep files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                                    desc = "Find buffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",                                  desc = "Help tags" },
      { "<leader>fv", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        show_close_icon = false,
        always_show_bufferline = false,
      },
    },
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfixes (Trouble)" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            dependencies = {
              "rafamadriz/friendly-snippets",
            },
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end
          },
        },
      },
    },
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        formatting = {
          format = lspkind.cmp_format(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>xs", "<cmd>SymbolsOutline<cr>", desc = "Symbols outline" },
    },
    opts = {
      keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "o",
        focus_location = "p",
        hover_symbol = "<C-space>",
        toggle_preview = "P",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
    },
    config = true,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = "<C-_>",
    },
    keys = { "<C-_>" },
    config = true,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[NeoVim]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      vim.b.miniindentscope_disable = true

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  }
})

local opt = vim.opt

-- Clipboard
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Background buffers
opt.hidden = true

-- Search and replace
opt.ignorecase = true
opt.inccommand = "nosplit"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Identation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Colorscheme
vim.opt.termguicolors = true

-- Key mappings
vim.keymap.set('n', 'gb', "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set('n', 'gB', "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>q', "<cmd>bd<cr>", { desc = "Close buffer" })
vim.keymap.set('n', '<leader>Q', "<cmd>bd!<cr>", { desc = "Force close buffer" })
vim.keymap.set('n', '<leader>w', "<cmd>update<cr>", { desc = "Update current file" })
vim.keymap.set('i', '<C-s>', "<cmd>update<cr>", { desc = "Update current file" })
vim.keymap.set('n', '<leader>c', "<cmd>quit<cr>", { desc = "Close window" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol", noremap = true })
vim.keymap.set('n', '<cr>', "o<esc>k", { desc = "Insert blank line below" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
