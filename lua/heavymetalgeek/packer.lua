vim.cmd [[packadd packer.vim]]
print("hello from init")

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'
    use 'itchyny/lightline.vim'
    use 'nvim-telescope/telescope.nvim'
    use 'rust-lang/rust.vim'
    use 'simrat39/rust-tools.nvim'
    use 'dense-analysis/ale'
    -- Color schemes
    -- use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    --use 'junegunn/fzf', { 'do': { -> fzf#install() } }
    use 'junegunn/fzf.vim'
end)
