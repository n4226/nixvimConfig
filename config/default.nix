{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix 
    ./telescope.nix
  ];

  config = {
  #colorschemes.gruvbox.enable = true;

  plugins = {
    lualine.enable = true;
    web-devicons.enable = true;

    oil.enable = true;
  };

  globals.mapleader = " ";
  enableMan = true;



 opts = {
       	number = true;
       	relativenumber = true;
       	shiftwidth = 2;

    updatetime = 100;
    undofile = true;

    scrolloff = 4;

 };
    viAlias = true;


    keymaps = [
      {
	key = "-";
	action = "<Cmd>Oil<CR>";
	options.desc = "Open parent directory in currnet window";
      }

      # exit terminal mode with esc
      {
	mode = "t";
	key = "<esc>";
	action = "<C-\\><C-n>";
	options.desc = "Open parent directory in currnet window";
      }

    # movement
    {
      mode = "n";
      key = "<D-j>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<D-k>";
      action = "<C-u>zz";
    }

    {
      mode = "n";
      key = "n";
      action = "nzz";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzz";
    }

    # Tabs
    {
      mode = "n";
      key = "<leader>t";
      action = "+tab";
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<CMD>tabnew<CR>";
      options.desc = "Create new tab";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<CMD>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<CMD>tabnext<CR>";
      options.desc = "Go to the sub-sequent tab";
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<CMD>tabprevious<CR>";
      options.desc = "Go to the previous tab";
    }
    ];


plugins.lsp = {
  enable = true;

  servers = {
    lua_ls.enable = true;
    clangd.enable = true;
    nixd.enable = true;
  };

};

plugins.cmp = {
  enable = true;
  autoEnableSources = true;
  settings.sources = [
    {name = "nvim_lsp";}
  ];

};
    # {name = "path";}
    # {name = "buffer";}

};

}
