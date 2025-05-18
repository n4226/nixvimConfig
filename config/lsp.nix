{ pkgs, ... }: {

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        cpp = [ "clang-format" ];
      };
      format_on_save = # Lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            -- if slow_format_filetypes[vim.bo[bufnr].filetype] then
            --   return
            -- end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
          end
        '';
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>mp";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>mp";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];

  plugins.lsp = {
    enable = true;

    servers = {
      lua_ls.enable = true;
      clangd.enable = true;
      nixd.enable = true;
    };
    # keymaps.lspBuf = {
    #   "gd" = "definition";
    #   "gD" = "references";
    #   "gt" = "type_definition";
    #   "gi" = "implementation";
    #   "K" = "hover";
    # };

    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        gr = {
          action = "references";
          desc = "Goto References";
        };
        gD = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        gI = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        gT = {
          action = "type_definition";
          desc = "Type Definition";
        };
        K = {
          action = "hover";
          desc = "Hover";
        };
        # what is this???
        "<leader>cw" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
        "<leader>cr" = {
          action = "rename";
          desc = "Rename";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
        };
        "<C-k>" = {
          action = "signature_help";
          desc = "Signature Help";
        };
      };
      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };

    };

  };
  # for rust?
  # rustaceanvim.enable = true;

  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;

    cmp-emoji = { enable = true; };
  };

  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [{
      lazyLoad = true;
      paths = "${pkgs.vimPlugins.friendly-snippets}";
    }];
  };

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      # experemental = {
      #   ghost-test = true;
      # };
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        { name = "nvim_lsp"; }
        {
          name = "buffer";
          keyword_length = 5;
        }
        {
          name = "path";
          keyword_length = 3;
        }
        {
          name = "luasnip";
          keyword_length = 3;
        }
      ];

      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";

        "<Tab>" =
          # lua 
          "      function(fallback)\n	local line = vim.api.nvim_get_current_line()\n	if line:match(\"^%s*$\") then\n	  fallback()\n	elseif cmp.visible() then\n	  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })\n	else\n	  fallback()\n	end\n      end\n      ";
        "<Down>" =
          # lua
          "      function(fallback)\n	if cmp.visible() then\n	  cmp.select_next_item()\n	elseif require(\"luasnip\").expand_or_jumpable() then\n	  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(\"<Plug>luasnip-expand-or-jump\", true, true, true), \"\")\n	else\n	  fallback()\n	end\n      end\n      ";
        "<Up>" =
          # lua
          "      function(fallback)\n	if cmp.visible() then\n	  cmp.select_prev_item()\n	elseif require(\"luasnip\").jumpable(-1) then\n	  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(\"<Plug>luasnip-jump-prev\", true, true, true), \"\")\n	else\n	  fallback()\n	end\n      end\n      ";

        # "<Tab>" = ''
        #   cmp.mapping(function(fallback)
        #     if cmp.visible() then
        #       cmp.select_next_item()
        #     elseif luasnip.expand_or_jumpable() then
        #       luasnip.expand_or_jump()
        #     else
        #       fallback()
        #     end
        #   end, { "i", "s" })
        # '';
        #
        # "<S-Tab>" = ''
        #   cmp.mapping(function(fallback)
        #     if cmp.visible() then
        #       cmp.select_prev_item()
        #     elseif luasnip.locally_jumpable(-1) then
        #       luasnip.jump(-1)
        #     else
        #       fallback()
        #     end
        #   end, { "i", "s" })
        # '';

        "<C-e>" = "cmp.mapping.abort()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<CR>" =
          "cmp.mapping.confirm({ select = false })"; # Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        "<S-CR>" =
          "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })";
      };

      formatting = {
        fields = [ "kind" "abbr" "menu" ];
        expandable_indicator = true;
        format =
          # lua
          "      function(_, item)\n	local icons = {\n	  Namespace = \"󰌗\",\n	  Text = \"󰉿\",\n	  Method = \"󰆧\",\n	  Function = \"󰆧\",\n	  Constructor = \"\",\n	  Field = \"󰜢\",\n	  Variable = \"󰀫\",\n	  Class = \"󰠱\",\n	  Interface = \"\",\n	  Module = \"\",\n	  Property = \"󰜢\",\n	  Unit = \"󰑭\",\n	  Value = \"󰎠\",\n	  Enum = \"\",\n	  Keyword = \"󰌋\",\n	  Snippet = \"\",\n	  Color = \"󰏘\",\n	  File = \"󰈚\",\n	  Reference = \"󰈇\",\n	  Folder = \"󰉋\",\n	  EnumMember = \"\",\n	  Constant = \"󰏿\",\n	  Struct = \"󰙅\",\n	  Event = \"\",\n	  Operator = \"󰆕\",\n	  TypeParameter = \"󰊄\",\n	  Table = \"\",\n	  Object = \"󰅩\",\n	  Tag = \"\",\n	  Array = \"[]\",\n	  Boolean = \"\",\n	  Number = \"\",\n	  Null = \"󰟢\",\n	  String = \"󰉿\",\n	  Calendar = \"\",\n	  Watch = \"󰥔\",\n	  Package = \"\",\n	  Copilot = \"\",\n	  Codeium = \"\",\n	  TabNine = \"\",\n	}\n\n	local icon = icons[item.kind] or \"\"\n	item.kind = string.format(\"%s %s\", icon, item.kind or \"\")\n	return item\n      end\n      ";
      };
      performance = {
        debounce = 60;
        fetching_timeout = 200;
        max_view_entries = 5;
      };
      window = {
        completion = {
          border = "rounded";
          # winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
        };
        documentation = { border = "rounded"; };
      };

    };
  };

  extraConfigLua = ''
          luasnip = require("luasnip")
          kind_icons = {
    	Text = "󰊄",
    	Method = "",
    	Function = "󰡱",
    	Constructor = "",
    	Field = "",
    	Variable = "󱀍",
    	Class = "",
    	Interface = "",
    	Module = "󰕳",
    	Property = "",
    	Unit = "",
    	Value = "",
    	Enum = "",
    	Keyword = "",
    	Snippet = "",
    	Color = "",
    	File = "",
    	Reference = "",
    	Folder = "",
    	EnumMember = "",
    	Constant = "",
    	Struct = "",
    	Event = "",
    	Operator = "",
    	TypeParameter = "",
          }
  '';

  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        autopairs.enable = true;

        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "html"
          "css"
          "javascript"
          "jsdoc"
          "json"
          "lua"
          "luadoc"
          "luap"
          "nix"
          "rust"
          "java"
          "markdown"
          "markdown_inline"
          "python"
          "query"
          "regex"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "toml"
          "yaml"
        ];

      };
    };
    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };
    rainbow-delimiters.enable = true;
  };

  # plugins.lint = {
  #    enable = true;
  #    lintersByFt = {
  #      c = [ "cpplint" ];
  #      cpp = [ "cpplint" ];
  #      go = [ "golangci-lint" ];
  #      nix = [ "statix" ];
  #      lua = [ "selene" ];
  #      python = [ "flake8" ];
  #      javascript = [ "eslint_d" ];
  #      javascriptreact = [ "eslint_d" ];
  #      typescript = [ "eslint_d" ];
  #      typescriptreact = [ "eslint_d" ];
  #      json = [ "jsonlint" ];
  #      java = [ "checkstyle" ];
  #      haskell = [ "hlint" ];
  #      bash = [ "shellcheck" ];
  #    };
  #  };

}
