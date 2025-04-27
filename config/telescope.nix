{

  config = {

    plugins.telescope = {
      enable = true;
      settings = { };
      # keymaps = {	
      # 	"<leader>ff" = "find_files";
      #   "<leader>fg" = "live_grep";
      #   "<C-p>" = {
      #     action = "git_files";
      #     options = {
      #       desc = "Telescope Git Files";
      #     };
      #   };
      # };

      # telescope isntall inspired by https://github.com/redyf/Neve/blob/main/config/telescope/telescope-nvim.nix

      keymaps = {
        "<leader><space>" = {
          action = "find_files";
          options.desc = "Find project files";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Grep (root dir)";
        };
        "<leader>:" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>b" = {
          action = "buffers";
          options.desc = "+buffer";
        };
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find project files";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Buffers";
        };
        "<C-p>" = {
          action = "git_files";
          options.desc = "Search git files";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Status";
        };
        # "<leader>sa" = {
        #   action = "autocommands";
        #   options.desc = "Auto Commands";
        # };
        "<leader>sb" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "Buffer";
        };
        "<leader>sc" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>sC" = {
          action = "commands";
          options.desc = "Commands";
        };
        # "<leader>sD" = {
        #   action = "diagnostics";
        #   options.desc = "Workspace diagnostics";
        # };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help pages";
        };
        "<leader>sH" = {
          action = "highlights";
          options.desc = "Search Highlight Groups";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "Keymaps";
        };
        "<leader>sM" = {
          action = "man_pages";
          options.desc = "Man pages";
        };
        "<leader>sm" = {
          action = "marks";
          options.desc = "Jump to Mark";
        };
        # "<leader>so" = {
        #   action = "vim_options";
        #   options.desc = "Options";
        # };
        "<leader>sR" = {
          action = "resume";
          options.desc = "Resume";
        };
        "<leader>uC" = {
          action = "colorscheme";
          options.desc = "Colorscheme preview";
        };
        # "<leader>fp" = {
        #   action = "projects";
        #   options.desc = "Projects";
        # };
        # "<leader>sd" = {
        #   action = "diagnostics bufnr=0";
        #   options.desc = "Document Diagnostics";
        # };
        # "<leader>st" = {
        #   action = "todo-comments";
        #   options.desc = "Todo (Telescope)";
        # };
      };
      extensions.fzf-native = { enable = true; };
    };
  };
}
