return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- LSP Support
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "rust-lang/rust.vim",
    },
    config = function()
        print('running lsp config...')
        local nvim_lsp = require('lspconfig')
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "zls",
            },
            handlers = {
                function(server_name)
                    nvim_lsp[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["rust_analyzer"] = function()
                    nvim_lsp.rust_analyzer.setup {
                        on_attach = function(client, bufnr)
                            print('rust_analyzer running...')
                        end,
                        settings = {
                            ["rust-analyzer"] = {
                                checkOnSave = { command = "clippy" },
                            }
                        }
                    }
                end
            }
        })

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ['<CR>'] = cmp.mapping.abort(),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            })
        })

        vim.diagnostic.config({
            virtual_text = true,
            float = {

                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
