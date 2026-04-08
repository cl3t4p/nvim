# smt2.nvim

Syntax highlighting and autocompletion for **SMT-LIB2** files in Neovim.

## Installation (lazy.nvim)

```lua
return {
  dir = "~/.config/nvim/plugins/smt2.nvim",
  ft = "smt2",
  opts = {},
}
```

## Completion

Works two ways:

- **nvim-cmp**: Registered automatically if cmp is installed. Completions appear as you type.
- **Omnifunc**: Always available via `<C-x><C-o>` even without cmp.

Covers all SMT-LIB2 commands, sorts, built-in operators (Bool, Arithmetic, BitVec, Array, String, Regex, Seq), logic names, attributes, and results.
