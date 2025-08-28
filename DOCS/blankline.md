# Indent Blankline

This plugin adds indentation guides to your code, making it easier to see the structure of nested blocks.

## Configuration

The configuration for `indent-blankline` is located in `lua/plugins/indent-blankline.lua`.

- It's configured to use the `│` character for the indent lines.
- It excludes certain filetypes like `dashboard` and `neo-tree` where the lines would be distracting.
- The plugin is set to load lazily for better performance.
