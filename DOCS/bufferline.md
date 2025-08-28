
# Bufferline

This plugin displays the open buffers in a line at the top of the editor, similar to tabs in other editors.

## Configuration

The configuration for `bufferline` is located in `lua/plugins/bufferline.lua`.

- **Diagnostics**: Shows LSP diagnostics in the bufferline.
- **Separator Style**: The style of the separator between buffer names. It's set to `slant`.
- **Offsets**: This is configured to avoid overlapping with the Neo-tree file explorer.

## Keybindings

- `<Tab>`: Go to the next buffer.
- `<S-Tab>`: Go to the previous buffer.
