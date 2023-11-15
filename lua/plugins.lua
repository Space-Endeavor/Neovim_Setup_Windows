-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require ("packer").startup(function(use)
    --Packer
    use("wbthomason/packer.nvim")

    --Common utilities
    use("nvim-lua/plenary.nvim")

    --Icons
    use("nvim-tree/nvim-web-devicons")

    --Colorschema
    use("rebelot/kanagawa.nvim")

    --Statusline
    use({
        "nvim-lualine/lualine.nvim",
        event = "BufEnter",
        config = function()
            require("configs.lualine")
        end,
        requires = { "nvim-web-devicpns" },
    })

    --Treesitter
    use({
        "nvim-treesitter/nvim-tresitter",
        run = function()
            require("configs.treesitter")
        end,
    })

    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    --Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {{"nvim-lua/plenary.nvim"}},
    })

    --LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require(configs.lsp)
        end,
    })

    use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        tag = "v<CurrentMajor>.*",
    })

    --cmp:Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
    })

    use("hrsh7th/cmp-nvim-lsp")

    use({"hrsh7th/cmp-path", after = "nvim-cmp"})
    use({"hrsh7th/cmp-buffer", after = "nvim-cmp"})
)