# unimpaired.nvim

### Description:

This adds blank lines and moves lines in neovim.

### Installation

Using [lazy](https://github.com/folke/lazy.nvim):

```lua
"9th8/unimpaired.nvim",
```
### Configuration

The `setup()` function takes a dictionary with user configurations. If you don't
want to customize the default behaviour, you don't need to put anything in
there. The default behaviour mimics the functionality off `vim-unimpaired`.

Customizing keymaps works as following:
```lua
require('unimpaired').setup()
```
