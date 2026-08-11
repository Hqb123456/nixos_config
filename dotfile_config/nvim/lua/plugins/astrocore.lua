-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- 显示相对行号
        number = true, -- 显示绝对行号
        spell = false, -- 禁用拼写检查
        signcolumn = "yes", -- 始终显示符号列
        wrap = false, -- 禁用自动换行
        tabstop = 4, -- Tab 显示为 4 格宽度
        shiftwidth = 4, -- 缩进宽度为 4 格
        expandtab = true, -- 将 Tab 转换为空格
        softtabstop = 4, -- 编辑时 Tab 键插入 4 个空格
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
    autocmds = {
      -- Disable guess-indent for C/C++ files to keep 4-space indentation
      GuessIndent = {
        {
          event = "BufReadPost",
          desc = "Guess indentation when loading a file (skip C/C++)",
          callback = function(args)
            local ft = vim.bo[args.buf].filetype
            if not vim.tbl_contains({ "c", "cpp", "h", "hpp" }, ft) then
              require("guess-indent").set_from_buffer(args.buf, true, true)
            end
          end,
        },
        {
          event = "BufNewFile",
          desc = "Guess indentation when saving a new file (skip C/C++)",
          callback = function(args)
            local ft = vim.bo[args.buf].filetype
            if not vim.tbl_contains({ "c", "cpp", "h", "hpp" }, ft) then
              vim.api.nvim_create_autocmd("BufWritePost", {
                buffer = args.buf,
                once = true,
                callback = function(wargs)
                  local ft2 = vim.bo[wargs.buf].filetype
                  if not vim.tbl_contains({ "c", "cpp", "h", "hpp" }, ft2) then
                    require("guess-indent").set_from_buffer(wargs.buf, true, true)
                  end
                end,
              })
            end
          end,
        },
      },
    },
  },
}
