# Neovim Installation and Setup

## Build Neovim from source

1. Follow the instructions provided by the [Neovim Wiki](https://github.com/neovim/neovim/wiki/Building-Neovim)
    - Ensure prerequisites are installed
    - I prefer to use the stable release
    - I use the default install location
2. Install Packer using the install step provided in the [Packer Quickstart](https://github.com/wbthomason/packer.nvim)
3. Clone this repository into `~/.config/`
4. Navigate to `~/.config/nvim/lua/heavymetalgeek/packer.lua`, source the file with `:so`, and run `:PackerInstall`
5. Enjoy!

*Note: I am still working on my remaps, which will be largely based on* [ThePrimeagen's](https://github.com/ThePrimeagen/init.lua)

