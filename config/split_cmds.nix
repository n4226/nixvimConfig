{pkgs, ...}: {
  config = {
    keymaps = [
      # Splits
      {
	mode = "n";
	key = "<leader>sh";
	action = "<C-w>s";
	options.desc = "Create new horizontal split";
      }
      {
	mode = "n";
	key = "<leader>sv";
	action = "<C-w>v";
	options.desc = "Create new vertical split";
      }

      # normal mode
      {
	mode = "n";
	key = "<A-L>";
	action = "<C-w>l";
	options.desc = "Go to right split";
	options = {
	  noremap = true;
	  silent = true;
	};
      }
      {
	mode = "n";
	key = "<A-H>";
	action = "<C-w>h";
	options.desc = "Go to left split";
	options = {
	  noremap = true;
	  silent = true;
	};
      }
      {
	mode = "n";
	key = "<A-J>";
	action = "<C-w>j";
	options.desc = "Go to down split";
	options = {
	  noremap = true;
	  silent = true;
	};
      }
      {
	mode = "n";
	key = "<A-K>";
	action = "<C-w>k";
	options.desc = "Go to up split";
	options = {
	  noremap = true;
	  silent = true;
	};
      }
      # full screen toggle
      {
	mode = "n";
	key = "<A-P>";
	action = "<cmd>ZoomWinTabToggle<CR>";
	options.desc = "toggle split full screen";
	options = {
	  noremap = true;
	  silent = true;
	};
      }



      # Terminal Mode
      {
	mode = "t";
	key = "<A-P>";
	action = "<cmd>ZoomWinTabToggle<CR>";
	options.desc = "toggle split full screen";
	options = {
	  noremap = true;
	  silent = true;
	};
      }
    ];
  };
}
