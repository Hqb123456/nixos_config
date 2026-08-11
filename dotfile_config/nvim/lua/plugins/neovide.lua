-- Neovide configuration
-- Only applies when running in Neovide GUI
if not vim.g.neovide then return {} end

return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          guifont = "JetBrainsMono Nerd Font:h16",
          guifontwide = "JetBrainsMono Nerd Font:h16",
        },
        g = {
          neovide_font_ligatures = true,
          neovide_cursor_animate_command_line = true,
          neovide_cursor_animate_in_insert_mode = true,
          neovide_cursor_vfx_mode = "tpixiedust",
          neovide_cursor_vfx_opacity = 200.0,
          neovide_cursor_vfx_particle_lifetime = 1.2,
          neovide_cursor_vfx_particle_density = 7.0,
          neovide_cursor_vfx_particle_speed = 10.0,
          neovide_cursor_vfx_particle_phase = 1.5,
          neovide_cursor_vfx_particle_curl = 1.0,
          neovide_opacity = 0.95,
          neovide_window_blurred = true,
          neovide_floating_blur_amount_x = 2.0,
          neovide_floating_blur_amount_y = 2.0,
          neovide_floating_shadow = true,
          neovide_floating_z_height = 10,
          neovide_light_angle_degrees = 45,
          neovide_light_radius = 5,
          neovide_refresh_rate = 144,
          neovide_refresh_rate_idle = 5,
          neovide_no_idle = false,
          neovide_confirm_quit = true,
          neovide_fullscreen = false,
          neovide_remember_window_size = true,
          neovide_input_macos_alt_is_meta = false,
          neovide_input_ime = true,
        },
      },
    },
  },
}
