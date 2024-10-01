local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")
  
  -- Gruvbox
  use("ellisonleao/gruvbox.nvim")

  -- Window Movement
  use("christoomey/vim-tmux-navigator")

  use("nvim-lua/plenary.nvim")

  use("nvim-tree/nvim-tree.lua")

  use("kyazdani42/nvim-web-devicons")

  use("nvim-lualine/lualine.nvim") 

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
 
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }


  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")

  use("hrsh7th/cmp-nvim-lsp")
  use ({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
          require('lspsaga').setup({})
      end,
  })
  use("onsails/lspkind.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end
  })

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("voldikss/vim-floaterm")
  use("romgrk/barbar.nvim")
  use("lewis6991/gitsigns.nvim")
 
  use("lukas-reineke/indent-blankline.nvim")

  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  use("ggandor/leap.nvim")
  use("rust-lang/rust.vim")
  use {'stevearc/overseer.nvim',
    config = function() require('overseer').setup() end
  }

  use {
    'amirali/yapf.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('yapf').setup {
                style = '{based_on_style: yapf}'
            }
    end,
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- use ('puremourning/vimspector')

  use 'andweeb/presence.nvim'
  use 'f-person/auto-dark-mode.nvim'
  use "terrortylor/nvim-comment"
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup {
        open_mapping = [[<c-t>]],
        direction = 'horizontal'
    }
  end}
end)
