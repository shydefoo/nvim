local M = {}

M._keys = {
  { "<leader>jD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  { "<leader>jl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  -- { "<leader>lR", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
  {
    "<leader>lR",
    function()
      require("inc_rename")
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    expr = true,
    desc = "Rename",
    has = "rename",
  },
  { "<leader>jif", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
  { "<leader>jd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },
  { "<leader>jr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  { "<leader>ji", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
  { "<leader>jt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
  { "<leader>jw", vim.lsp.buf.hover, desc = "Hover Signature Help", has = "signatureHelp" },
  { "<leader>js", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  { "<leader>j]", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<leader>j[", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  {
    "<leader>jca",
    vim.lsp.buf.code_action,
    desc = "Code Action",
    mode = { "n", "v" },
    has = "codeAction",
  },
  {
    "<leader>jcl",
    vim.lsp.buf.codelens,
    desc = "Code Lens",
    mode = { "n", "v" },
    has = "codeLens",
  },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>jle", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
  { "<leader>jq", vim.diagnostic.setloclist, desc = "Diagnostics in qflist" },
  -- NOTE: Not sure what this does
  -- { "<leader>jws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  -- { "<leader>jwd", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Symbols" },
  -- { "<leader>jwa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder" },
  -- { "<leader>jwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Folders" },
  -- { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
}
function M.on_attach(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}

  for _, value in ipairs(M._keys) do
    local keys = Keys.parse(value)
    if keys.rhs == vim.NIL or keys.rhs == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      opts.has = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
    end
  end
end

return M
