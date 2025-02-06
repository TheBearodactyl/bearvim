local M = {}

function M.setup()
  require("blade-nav").setup({
    close_tag_on_complete = true,
  })

  require("laravel").setup({})
end

return M
