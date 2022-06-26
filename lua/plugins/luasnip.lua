local luasnip = require("luasnip")
luasnip.config.setup({
  history = false,
})

-- Stop snippets when you leave to normal mode
-- https://github.com/L3MON4D3/LuaSnip/issues/258
local leave_snippet = function()
  if
    ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
    and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
    and not luasnip.session.jump_active
  then
    luasnip.unlink_current()
  end
end

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = leave_snippet,
})
