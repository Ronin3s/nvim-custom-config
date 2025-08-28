
# Neo-tree

This plugin provides a file explorer tree.

## Configuration

The configuration for `neo-tree` is located in `lua/plugins/neotree.lua`.

- **Window Position**: The file explorer is positioned on the left.
- **Sources**: It can display the filesystem and open buffers.
- **Filtered Items**: It's configured to hide dotfiles, gitignored files, and hidden files.
- **Follow Current File**: The tree will follow the currently open file.

## Keybindings

- `<leader>e`: Toggle the file explorer.
- `<leader>b`: Toggle the buffer explorer.

### Inside Neo-tree

- `l`: Open file
- `S`: Open in a horizontal split
- `s`: Open in a vertical split
- `t`: Open in a new tab
- `R`: Refresh
- `a`: Add file/directory
- `d`: Delete
- `r`: Rename
- `y`: Copy to clipboard
- `x`: Cut to clipboard
- `p`: Paste from clipboard
