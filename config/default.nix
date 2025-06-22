{ self, pkgs, ... }: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./telescope.nix
    ./git.nix
    ./lsp.nix
    ./split_cmds.nix
    ./spellcheck.nix
    ./obsidian.nix
    ./harpoon.nix
    ./undotree.nix
    ./convienience_keymaps.nix
  ];

  config = {
    #colorschemes.gruvbox.enable = true;
    colorschemes.tokyonight.enable = true;
    colorschemes.tokyonight.transparent = true;

    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;

      oil = {
        enable = true;
        settings = {
          view_options = { show_hidden = true; };
          keymaps = { "<leader>qq" = "actions.close"; };
        };
      };

      nvim-autopairs = { enable = true; };
      trouble.enable = true;

    };

    globals.mapleader = " ";
    enableMan = true;

    extraPlugins = with pkgs.vimPlugins; [
      vim-be-good
      (pkgs.vimUtils.buildVimPlugin {
        pname = "ouroboros.nvim";
        version = "master";
        src = pkgs.fetchFromGitHub {
          owner = "jakemason";
          repo = "ouroboros.nvim";
          rev = "master";
          sha256 = "sha256-PEyXMsCkK9yR39iU5h6rSjXJFUTCB8R4hzWQX25H3h0";
        };
      })
      zoomwintab-vim
    ];

    opts = {
      number = true;
      relativenumber = true;

      #indenting
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      updatetime = 100;
      undofile = true;
      hlsearch = false;
      incsearch = true;

      scrolloff = 8;

      conceallevel = 2;
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
        options.desc = "Exit Temrinal Mode";
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
      # also bind esc + j and k for iterm remaping of cmd
      {
        mode = "n";
        key = "<Esc>[j";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<Esc>[k";
        action = "<C-u>zz";
      }
      {
        mode = "v";
        key = "<Esc>[j";
        action = "<C-d>zz";
      }
      {
        mode = "v";
        key = "<Esc>[k";
        action = "<C-u>zz";
      }

      # other cmds
      # go back file
      {
        mode = "n";
        key = "_";
        action = "<CMD>b#<CR>";
      }
      {
        mode = "n";
        key = "<Esc>[_";
        action = "<CMD>b#<CR>";
      }
      # go back (includes oil pages)
      {
        mode = "n";
        key = "gb";
        action = "<C-o>";
      }
      # header cpp toggle
      {
        mode = "n"; # normal mode
        key = "<A-o>"; # Alt+o
        action = "<cmd>Ouroboros<CR>";
      }
      {
        mode = "n"; # normal mode
        key = "<Esc>[o"; # Alt+o
        action = "<cmd>Ouroboros<CR>";
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

      # obsidian
      {
        mode = "n"; # normal mode
        key = "gf";
        action = "require('obsidian').util.gf_passthrough()";
        options = {
          noremap = false;
          expr = true;
          buffer = true;
        };
      }
    ];

  };
}
