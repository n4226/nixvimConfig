{pkgs, ... }: {
  plugins = {
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
  };

  keymaps = [
    {
      mode = "n"; key = "<leader>ha"; action = ":lua require('harpoon.mark').add_file()<CR>"; options.desc = "Harpoon Add File";
    }
    {
      mode = "n"; key = "<leader>hm"; action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"; options.desc = "Harpoon Menu";
    }
    {
      mode = "n"; key = "<leader>h1"; action = ":lua require('harpoon.ui').nav_file(1)<CR>"; options.desc = "Harpoon Go File 1";
    }
    {
      mode = "n"; key = "<leader>h2"; action = ":lua require('harpoon.ui').nav_file(2)<CR>"; options.desc = "Harpoon Go File 2";
    }
    {
      mode = "n"; key = "<leader>h3"; action = ":lua require('harpoon.ui').nav_file(3)<CR>"; options.desc = "Harpoon Go File 3";
    }
    {
      mode = "n"; key = "<leader>h4"; action = ":lua require('harpoon.ui').nav_file(4)<CR>"; options.desc = "Harpoon Go File 4";
    }
  ];
}
