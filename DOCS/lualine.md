
# Lualine

This plugin provides a statusline at the bottom of the editor.

## Configuration

The configuration for `lualine` is located in `lua/plugins/lualine.lua`.

- **Theme**: The theme is set to `auto`, which should match the colorscheme.
- **Components**: The statusline is composed of several components:
  - `lualine_a`: Mode
  - `lualine_b`: Branch, diff, diagnostics
  - `lualine_c`: Filename
  - `lualine_x`: Encoding, fileformat, filetype
  - `lualine_y`: Progress
  - `lualine_z`: Location
