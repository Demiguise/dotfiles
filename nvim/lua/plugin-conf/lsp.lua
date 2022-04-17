local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
local servers = { 
  'sumneko_lua'
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

local nvim_data_path = vim.fn.stdpath('data').."/lsp_servers/"

-- lua lspconfig
nvim_lsp['sumneko_lua'].setup {
  cmd = { nvim_data_path.."sumneko_lua/extension/server/bin/lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

nvim_lsp['clangd'].setup {
  cmd = { nvim_data_path.."clangd/clangd/bin/clangd" }
}

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "rust_analyzer" then
    local tools = require("rust-tools")
    tools.setup {
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
    }
    server:attach_buffers()
    tools.start_standalone_if_required()
  else
    server:setup(opts)
  end
end)
