local api = vim.api

api.nvim_create_user_command("Wqa", function()
  vim.cmd "wall"

  for _, buffer in ipairs(api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buffer) then
      local buffer_type = vim.bo[buffer].buftype
      if buffer_type == "terminal" then
        vim.cmd("bdelete! " .. buffer)
      end
    end
  end

  vim.cmd "qa!"
end, {
  desc = "Write all, close terminal buffers, quit all",
})
