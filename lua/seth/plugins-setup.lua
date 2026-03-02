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

require("lazy").setup({

	-- Colorschemes
	-- "ellisonleao/gruvbox.nvim",
	"sainnhe/everforest",
	"sainnhe/gruvbox-material",

	-- Window movement
	"christoomey/vim-tmux-navigator",

	"nvim-lua/plenary.nvim",

	"nvim-tree/nvim-tree.lua",
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	"hrsh7th/cmp-nvim-lsp",
	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("lspsaga").setup({})
		end,
	},
	"onsails/lspkind.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	"voldikss/vim-floaterm",
	"romgrk/barbar.nvim",
	"lewis6991/gitsigns.nvim",

	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	{ url = "https://codeberg.org/andyg/leap.nvim" },
	"rust-lang/rust.vim",
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
	},

	-- "mfussenegger/nvim-jdtls",

	{
		"amirali/yapf.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("yapf").setup({
				style = "{based_on_style: yapf}",
			})
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- "puremourning/vimspector",

	"JavaHello/spring-boot.nvim",
	"MunifTanjim/nui.nvim",
	"mfussenegger/nvim-dap",
	"nvim-java/nvim-java",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"ray-x/lsp_signature.nvim",
	"karb94/neoscroll.nvim",
	"stevearc/conform.nvim",
	"CopilotC-Nvim/CopilotChat.nvim",
	{ "folke/snacks.nvim", lazy = false, priority = 1000 },
	"folke/sidekick.nvim",
	
	"andweeb/presence.nvim",
	"f-person/auto-dark-mode.nvim",
	"terrortylor/nvim-comment",
	{
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-t>]],
				direction = "horizontal",
			})
		end,
	},
})
