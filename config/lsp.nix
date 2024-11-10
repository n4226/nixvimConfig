{
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
  settings = {
    mapping = {
      "<C-Space>" = "cmp.mapping.complete()";
    };
    # completion.autocomplete = "require('cmp.types').cmp.TriggerEvent.TextChanged";
  };
  settings.sources = [
    {name = "nvim_lsp";}
  ];

};
    # {name = "path";}
    # {name = "buffer";}

}
