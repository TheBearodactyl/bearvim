local M = {}

function M.setup()
  local pog = "https://files.catbox.moe/cfuyxh.png"

  require("cord").setup({
    editor = {
      client = "vim",
      tooltip = "W O A H",
      icon = pog,
    },
    display = {
      theme = "pastel",
    },
  })
end

return M
