local on_attach = require("shared.lsp-bindings")

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  angularls = {
    filetypes = { "ts", "typescript", "html", "typescriptreact", "typescript.tsx" },
    cmd = { "ngserver", "--stdio", "--tsProbeLocations", "/home/fisnik/.local/share/nvm/v21.6.1/lib/node_modules/tsc", "--ngProbeLocations", "/home/fisnik/.local/share/nvm/v21.6.1/lib/node_modules/@angular/language-server" }
  },
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {
    cargo = {
      allFeatures = true
    },
    filetypes = { "rust" }
  },
  tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs' } },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  jdtls = {}
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name ~= "jdtls" then
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end
  end,
}
--
-- local angular_cmd = {"ngserver", "--stdio", "--tsProbeLocations", "/home/fisnik/.local/share/nvim/mason/bin/typescript-language-server" , "--ngProbeLocations", "/home/fisnik/.local/share/nvm/v21.6.1/lib/node_modules/@angular/language-server"}
--
-- require'lspconfig'.angularls.setup{
--   cmd = angular_cmd,
--   capabilities = capabilities,
--   on_attach = on_attach,
--   on_new_config = function(new_config,new_root_dir)
--     new_config.cmd = angular_cmd
--   end,
-- }

local util = require('lspconfig.util')
require 'lspconfig'.angularls.setup {
  root_dir = util.root_pattern('.git')
}
