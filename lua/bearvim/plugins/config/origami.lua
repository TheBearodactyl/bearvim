local M = {}

function M.setup()
  require("origami").setup({
    keepFoldsAcrossSessions = true,
    pauseFoldsOnSearch = true,
    setupFoldKeymaps = true,

    hOnlyOpensOnFirstColumn = false,
  })
end

return M
