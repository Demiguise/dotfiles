local cfg = require('dev.local')
local servers = cfg.lsp_servers

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp.name].setup {
    capabilities = capabilities,
    cmd = { lsp.exe },
  }
end
