{pkgs, ...}:
{
  plugins = {

      obsidian = {
	enable = true;
	settings = {
	  completion = {
	    min_chars = 2;
	    nvim_cmp = true;
	  };
	  new_notes_location = "notes_subdir";
	  workspaces = [
	    {
	      name = "personal";
	      path = "~/vault/personal";
	    }
	  ];
	  ui = {
	    enable = true;
	    update_debounce = 200;
	    max_file_length = 5000;

	    checkboxes = {
	      " " = { char = "󰄱"; hl_group = "ObsidianTodo"; };
	      "x" = { char = ""; hl_group = "ObsidianDone"; };
	      ">" = { char = ""; hl_group = "ObsidianRightArrow"; };
	      "~" = { char = "󰰱"; hl_group = "ObsidianTilde"; };
	      "!" = { char = ""; hl_group = "ObsidianImportant"; };
	    };

	    bullets = { char = "•"; hl_group = "ObsidianBullet"; };

	    external_link_icon = { char = ""; hl_group = "ObsidianExtLinkIcon"; };

	    reference_text = { hl_group = "ObsidianRefText"; };
	    highlight_text = { hl_group = "ObsidianHighlightText"; };
	    tags = { hl_group = "ObsidianTag"; };
	    block_ids = { hl_group = "ObsidianBlockID"; };

	    hl_groups = {
	      ObsidianTodo         = { bold = true; fg = "#f78c6c"; };
	      ObsidianDone         = { bold = true; fg = "#89ddff"; };
	      ObsidianRightArrow   = { bold = true; fg = "#f78c6c"; };
	      ObsidianTilde        = { bold = true; fg = "#ff5370"; };
	      ObsidianImportant    = { bold = true; fg = "#d73128"; };
	      ObsidianBullet       = { bold = true; fg = "#89ddff"; };
	      ObsidianRefText      = { underline = true; fg = "#c792ea"; };
	      ObsidianExtLinkIcon  = { fg = "#c792ea"; };
	      ObsidianTag          = { italic = true; fg = "#89ddff"; };
	      ObsidianBlockID      = { italic = true; fg = "#89ddff"; };
	      ObsidianHighlightText = { bg = "#75662e"; };
	    };
	  };
	};
      };
  };
}
