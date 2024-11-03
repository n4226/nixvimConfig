{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  config = {
  #colorschemes.gruvbox.enable = true;

  plugins = {
    lualine.enable = true;
  };

  globals.mapleader = " ";

 opts = {
       	number = true;
       	relativenumber = true;
       	shiftwidth = 2;
 };


plugins.telescope = {
    enable = true;
    keymaps = {	
    	"<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<C-p>" = {
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
    };
    extensions.fzf-native = { enable = true; };
  };


plugins.lsp = {
  enable = true;

  servers = {
    lua_ls.enable = true;
    clangd.enable = true;
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
