{ self, pkgs, ... }: 
{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix 
    ./telescope.nix
    ./git.nix
    ./lsp.nix
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

  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
  ];


 opts = {
       	number = true;
       	relativenumber = true;
       	shiftwidth = 2;

    updatetime = 100;
    undofile = true;

    scrolloff = 4;

 };
    vimAlias = true;


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
      mode = "v";
      key = "<D-j>";
      action = "<C-d>zz";
    }
    {
      mode = "v";
      key = "<D-k>";
      action = "<C-u>zz";
    }
    # also bind for Alt key so TMUX can remap D-j to A-j which will be seen here
    {
      mode = "n";
      key = "<A-j>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<C-u>zz";
    }
    {
      mode = "v";
      key = "<A-j>";
      action = "<C-d>zz";
    }
    {
      mode = "v";
      key = "<A-k>";
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


};
}
