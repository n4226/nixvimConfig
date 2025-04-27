{pkgs, ... }:
{
  config = {
    plugins = {
      undotree = {
	enable = true;
      };
    };
  };
  config = {
    keymaps = [
      # Splits
      {
	mode = "n";
	key = "<leader>u";
	action = "<cmd>UndotreeToggle<CR>";
      }
    ];
  };
}
