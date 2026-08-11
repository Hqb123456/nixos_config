if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return { 'RRethy/base16-nvim',
  config = function()
    local ok, matugen = pcall(require, 'matugen')
    if ok then matugen.setup() end
  end,
}
