local null_ls = require("null-ls")
local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Disable signs
  signs = false,
})

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local flags = {
  debounce_text_changes = 500,
}

local setup_code_formatting = function(client, bufnr)
  local format_on_save = true

  -- Local project autosave settings
  local path = vim.fn.expand("#" .. bufnr .. ":p")
  local ft = vim.opt.filetype:get()
  if string.find(path, "/wikimedia/") then
    if ft == "vue" or ft == "javascript" then
      format_on_save = client.name == "eslint"
    end
  end

  if format_on_save then
    vim.cmd([[
      augroup LspFormatOnSave
        autocmd!
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
      augroup END
    ]])
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Enable format on save if the language server supports it
  if client.resolved_capabilities.document_formatting then
    setup_code_formatting(client, bufnr)
  end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[w", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]w", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
end

local servers = {
  rust_analyzer = {},
  tsserver = {
    on_attach = function(client, bufnr)
      -- Don't use tsserver to format
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      on_attach(client, bufnr)
    end,
  },
  cssls = {},
  elmls = {},
  html = {},
  vuels = {},
  eslint = {
    on_attach = function(client, bufnr)
      -- https://github.com/neovim/nvim-lspconfig/pull/1299#issuecomment-942214556
      client.resolved_capabilities.document_formatting = true
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

      local sumneko_root_path
      if system_name == "Linux" then
        sumneko_root_path = "/home/joakin/dev/forks/lua-language-server/bin/Linux/"
      else
        error("Unimplemented")
      end
      return { sumneko_root_path .. "lua-language-server", "-E", sumneko_root_path .. "main.lua" }
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
  ["null-ls"] = (function()
    null_ls.config({
      diagnostics_format = "#{m} [#{c} #{s}]",
      debounce = 500,
      -- you must define at least one source for the plugin to work
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
    return {}
  end)(),
}

for lsp, options in pairs(servers) do
  nvim_lsp[lsp].setup(vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
  }, options))
end
