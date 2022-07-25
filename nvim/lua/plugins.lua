local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
print("install_path: " .. install_path)
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    download_result = fn.system({'ls', '-l', install_path})
    print("download_result: " .. download_result)
end

vim.cmd [[packadd packer.nvim]] -- packadd packer module

return require('packer').startup(function(use)

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

    use 'wbthomason/packer.nvim'
    requires = {{'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter'}}
    
    use 'nvim-telescope/telescope.nvim'
    use 'gruvbox-community/gruvbox'
    use 'vim-airline/vim-airline'
    use 'airblade/vim-gitgutter'
end)

