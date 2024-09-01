local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
--os.execute("mkdir " .. workspace_dir)
local on_attach = require("shared.lsp-bindings")

local config = {
  cmd = {
    'java',
    --		'/home/linuxbrew/.linuxbrew/Cellar/openjdk/21.0.2/libexec/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:/home/fisnik/.local/share/nvim/mason/packages/jdtls/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    '/home/fisnik/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration', '/home/fisnik/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', vim.fn.expand('~/.cache/jdtls/workspace/') .. project_name,

    --'/home/fisnik/.local/share/nvim/mason/bin/jdtls'

    --	 '-javaagent:home/fisnik/.local/share/eclipse/lombok.jar',
  },
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  capabilities = capabilities,
  on_attach = on_attach,
 --  settings = {
 --    java = {

 --    }
 --  },
 --  init_options = {
 --    bundles = {}
 --  },

}
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end
jdtls.start_or_attach(config)

-- Needed for debugging
--config['on_attach'] = function(client, bufnr)
--  jdtls.setup_dap({ hotcodereplace = 'auto' })
--  require('jdtls.dap').setup_dap_main_class_configs()
--end

