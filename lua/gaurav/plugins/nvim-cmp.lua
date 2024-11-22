return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- ["<C-J>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     vim.fn["copilot#Accept"]("")
        --   end
        -- end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "copilot", priority = 1000 }, -- High priority for Copilot
        { name = "nvim_lsp", priority = 900 }, -- LSP with slightly lower priority
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, -- Text within buffer
        { name = "path" }, -- File system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        fields = { "abbr", "kind", "menu" }, -- Define the order of fields shown
        expandable_indicator = true, -- Show an indicator for expandable items
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          with_text = true,
          menu = {
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]",
          },
        }),
      },
    })
  end,
}
