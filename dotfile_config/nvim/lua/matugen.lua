 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0f141c',
    base01 = '#1b2029',
    base02 = '#252a33',
    base03 = '#8791a5',
    base04 = '#bdc7dc',
    base05 = '#dee2ef',
    base06 = '#dee2ef',
    base07 = '#dee2ef',
    base08 = '#ffb4ab',
    base09 = '#a7c8ff',
    base0A = '#82d3e2',
    base0B = '#50d8ed',
    base0C = '#a7c8ff',
    base0D = '#50d8ed',
    base0E = '#82d3e2',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#dee2ef',          bg = '#0f141c' })
  hi('TelescopeBorder',         { fg = '#8791a5',             bg = '#0f141c' })
  hi('TelescopePromptNormal',   { fg = '#dee2ef',          bg = '#0f141c' })
  hi('TelescopePromptBorder',   { fg = '#8791a5',             bg = '#0f141c' })
  hi('TelescopePromptPrefix',   { fg = '#50d8ed',             bg = '#0f141c' })
  hi('TelescopePromptCounter',  { fg = '#bdc7dc',  bg = '#0f141c' })
  hi('TelescopePromptTitle',    { fg = '#0f141c',             bg = '#50d8ed' })
  hi('TelescopePreviewTitle',   { fg = '#0f141c',             bg = '#82d3e2' })
  hi('TelescopeResultsTitle',   { fg = '#0f141c',             bg = '#a7c8ff' })
  hi('TelescopeSelection',      { fg = '#dee2ef',          bg = '#252a33' })
  hi('TelescopeSelectionCaret', { fg = '#50d8ed',             bg = '#252a33' })
  hi('TelescopeMatching',       { fg = '#50d8ed',             bold = true })
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
