-- Customize Treesitter
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "nix",
        "c",
        "cpp",
        "json",
        "yaml",
        "toml",
	      "kdl",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
      },
    },
  },
}
