local lsp = require("lsp-zero")
local nvim_lsp = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    --"eslint",
    --"sumneko_lua",
    "denols",
    "clangd",
    "rust_analyzer"
})

-- Fix undefined global 'vim'
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

vim.g.markdown_fenced_languages = { "ts=typescript" }
lsp.configure("denols", {
    on_attach = function(client, bufnr)
        print('denols running...')
    end,
    init_options = { enable = true, lint = true },
    root_dir = nvim_lsp.util.root_pattern("deno.json"),
})
lsp.configure("tsserver", {
    on_attach = function(client, bufnr)
        print('tsserver running...')
    end,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    init_options = { lint = true },
})
lsp.configure("rust_analyzer", {
    on_attach = function(client, bufnr)
        print('rust_analyzer running...')
    end
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }),
    ['<CR>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return

    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
-- vim.g.rustfmt_autosave = 1
