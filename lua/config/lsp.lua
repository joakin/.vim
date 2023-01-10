local null_ls = require("null-ls")
local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local flags = {
  debounce_text_changes = 500,
}

local lsp_formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local setup_code_formatting = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_formatting_augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({
        timeout_ms = 1000,
        filter = function(client)
          if client.name == "tsserver" then
            return false
          end
          -- Local project autosave settings
          local path = vim.fn.expand("#" .. bufnr .. ":p")
          local ft = vim.opt.filetype:get()

          if ft == "jst" and client.name == "html" then
            return false
          end

          if string.find(path, "/wikimedia/") then
            if ft == "json" then
              return false
            elseif ft == "vue" or ft == "javascript" then
              return client.name == "eslint"
            end
          end
          return true
        end,
      })
    end,
  })
end

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- print(vim.inspect(vim.lsp.get_active_clients()[1].resolved_capabilities))

  -- Enable format on save if the language server supports it
  if client.server_capabilities.documentFormattingProvider then
    setup_code_formatting(bufnr)
  end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, opts)
  vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts)

  vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)

  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)

  vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[w", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "[@", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]w", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]@", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)
end

local servers = {
  ocamllsp = {},
  rust_analyzer = {},
  tsserver = {
    root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "node_modules"),
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
  },
  denols = {
    root_dir = nvim_lsp.util.root_pattern("deno.json", "import_map.json"),
    init_options = {
      lint = true,
    },
  },
  cssls = {},
  elmls = {},
  html = {},
  vuels = {},
  eslint = {
    on_attach = function(client, bufnr)
      -- https://github.com/neovim/nvim-lspconfig/pull/1299#issuecomment-942214556
      client.server_capabilities.documentFormattingProvider = true
      on_attach(client, bufnr)
    end,
  },
  sumneko_lua = {
    cmd = (function()
      local system_name
      if vim.fn.has("mac") == 1 then
        system_name = "macOS"
      elseif vim.fn.has("unix") == 1 then
        system_name = "Linux"
      elseif vim.fn.has("win32") == 1 then
        system_name = "Windows"
      end

      if system_name == "Linux" then
        -- local sumneko_root_path = "/home/joakin/dev/forks/lua-language-server/bin/Linux/"
        -- return { sumneko_root_path .. "lua-language-server", "-E", sumneko_root_path .. "main.lua" }
        return { "/home/linuxbrew/.linuxbrew/bin/lua-language-server" }
      elseif system_name == "macOS" then
        return { "/usr/local/bin/lua-language-server" }
      else
        error("Unimplemented lua-language-server on Windows")
      end
    end)(),
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = (function()
            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            return runtime_path
          end)(),
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("*.lua", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

for lsp, options in pairs(servers) do
  nvim_lsp[lsp].setup(vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    flags = flags,
  }, options))
end

null_ls.setup({
  diagnostics_format = "#{m} [#{c} #{s}]",
  debounce = 500,
  on_attach = on_attach,
  sources = {
    null_ls.builtins.formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file("stylua.toml")
      end,
    }),
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.shellcheck,
  },
})
