 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0a1519',
    base01 = '#162125',
    base02 = '#212c30',
    base03 = '#7e949d',
    base04 = '#b3cad4',
    base05 = '#d8e4ea',
    base06 = '#d8e4ea',
    base07 = '#d8e4ea',
    base08 = '#ffb4ab',
    base09 = '#87d1eb',
    base0A = '#89d6b9',
    base0B = '#64dbb4',
    base0C = '#87d1eb',
    base0D = '#64dbb4',
    base0E = '#89d6b9',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#d8e4ea',          bg = '#0a1519' })
  hi('TelescopeBorder',         { fg = '#7e949d',             bg = '#0a1519' })
  hi('TelescopePromptNormal',   { fg = '#d8e4ea',          bg = '#0a1519' })
  hi('TelescopePromptBorder',   { fg = '#7e949d',             bg = '#0a1519' })
  hi('TelescopePromptPrefix',   { fg = '#64dbb4',             bg = '#0a1519' })
  hi('TelescopePromptCounter',  { fg = '#b3cad4',  bg = '#0a1519' })
  hi('TelescopePromptTitle',    { fg = '#0a1519',             bg = '#64dbb4' })
  hi('TelescopePreviewTitle',   { fg = '#0a1519',             bg = '#89d6b9' })
  hi('TelescopeResultsTitle',   { fg = '#0a1519',             bg = '#87d1eb' })
  hi('TelescopeSelection',      { fg = '#d8e4ea',          bg = '#212c30' })
  hi('TelescopeSelectionCaret', { fg = '#64dbb4',             bg = '#212c30' })
  hi('TelescopeMatching',       { fg = '#64dbb4',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
