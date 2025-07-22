# Neovim Configuration — Fast. Functional. Ruthlessly Efficient.

This is a lean, keyboard-driven Neovim setup for developers who care about performance and control. Faster than Visual Studio. Less bloated than Emacs. Sharper than your average IDE.

Themes? Optional. Nerdfonts? Not required. This config focuses on precision and simplicity without sacrificing power. Feature-rich without compromising performance and efficiency.

---

## Table of Contents

- [Features Overview](#features-overview)
- [File Structure](#file-structure)
- [Keybindings](#keybindings)
  - [General](#general)
  - [Navigation](#navigation)
  - [LSP / Code](#lsp--code)
  - [Git](#git)
  - [Plugins](#plugins)
- [Theme System (Optional)](#theme-system-optional)
- [Requirements](#requirements)
- [Philosophy](#philosophy)
- [Plugin Stack](#plugin-stack)
- [Installation](#installation)
- [License](#license)

---

## Features Overview

- **Fast Startup** — Sub-100ms load time with lazy-loading
- **Nano-style Keybinds** — Familiar navigation for newcomers and power users
- **Plugin Keybinds** — Logical, low-friction shortcuts for every integrated tool
- **Clipboard Integration** — Seamless Wayland clipboard support (`wl-clipboard`)
- **Built-in LSP** — Out-of-the-box support for major languages
- **Treesitter Syntax** — Modern, granular syntax highlighting
- **Autocompletion** — With `nvim-cmp` and snippet expansion
- **Integrated Terminal** — One keypress away
- **Git Integration** — Visual diffs, gutter signs, and staging commands
- **Fuzzy Finder** — Fast, file-aware navigation with `telescope`
- **Theme Switching** — Runtime color scheme switching with `:SetTheme <name>`
- **No Nerd Fonts Required** — Clean visuals with standard fonts

---

## File Structure

```
~/.config/nvim
├── init.lua              # Main config entry
├── lua/
│   ├── core/             # Options, keymaps, autocmds
│   ├── plugins/          # Plugin specs and setup
│   ├── colors/           # Theme modules
│   └── utils/            # Helpers (clipboard, theme switching, etc.)
```

---

## Keybindings

### General
| Keybind     | Action                      |
|------------|------------------------------|
| Ctrl + S / o | Save file (`:w`)             |
| Ctrl + Q / x | Quit file (`:q`)             |
| Ctrl + K     | Cut current line             |
| Ctrl + U     | Paste                        |
| Ctrl + W     | Search                       |
| Ctrl + Z     | Undo                         |
| Alt + E      | Redo                         |
| Ctrl + A     | Move to beginning of line    |
| Ctrl + E     | Move to end of line          |
| Leader + w   | Save                         |
| Leader + q   | Quit                         |
| Leader + x   | Save and quit                |
| Leader + c   | Close buffer                 |

### Navigation
| Keybind         | Action                         |
|----------------|----------------------------------|
| Ctrl + H/L/J/K  | Move between windows            |
| Ctrl + Arrows   | Resize window                   |
| Shift + H/L     | Previous / next buffer          |
| Leader + e      | Toggle file tree                |
| Leader + f      | Find files                      |
| Leader + g      | Live grep                       |
| Leader + b      | List buffers                    |
| Leader + h      | Help tags                       |

### LSP / Code
| Keybind     | Action                         |
|------------|----------------------------------|
| gd          | Go to definition                |
| gi          | Go to implementation            |
| gr          | Find references (Lspsaga)       |
| K           | Hover docs                      |
| Leader + rn | Rename (Lspsaga)                |
| Leader + ca | Code action                     |
| [d / ]d     | Previous / next diagnostic      |
| Leader + dl | Show diagnostics in telescope   |

### Git
| Keybind     | Action                         |
|------------|----------------------------------|
| Leader + gs | Git status                      |
| Leader + gp | Git push                        |
| Leader + gl | Git pull                        |
| ]g / [g     | Next / previous hunk            |
| Leader + hp | Preview hunk                    |
| Leader + hs | Stage hunk                      |
| Leader + hr | Reset hunk                      |

### Plugins
| Keybind       | Action                          |
|--------------|----------------------------------|
| Leader + mp/ms | Start/Stop markdown preview    |
| Leader + qo/qc | Open/Close quickfix            |
| Leader + lo/lc | Open/Close location list       |
| Leader + xx/xX | Toggle diagnostics/all/buffer  |
| Leader + cs/cl | Show symbols/LSP items         |
| Leader + xL/xQ | Location/Quickfix list         |
| Leader + sr    | Open Spectre                   |
| Leader + /     | Toggle comment                 |
| Leader + t     | Toggle terminal                |
| Ctrl + T       | Next theme                     |

---

## Theme System (Optional)

Themes are modular Lua files in `lua/colors/` and are switchable at runtime:

```vim
:SetTheme oxocarbon
```

Each theme includes consistent styling for:
- Statusline / Tabline
- `nvim-tree` sidebar
- GitSigns
- Popup menus, diagnostics, and UI elements

### Official Themes:
- oxocarbon, gruvbox, everforest, tokyonight, catppuccin, dracula, monokai, nord, solarized, aperture

### Homebrew Themes:
- nebula, verdant, sapphire, ronin, claret, bloodsport, cafe, cafeexpresso, matcha, matchamoon

Special: `soyjacksunset` is available via secret command. Use at your own risk.

There is **no theme switcher UI** — theme cycling is handled with `<C-t>`, and manual selection uses the `:SetTheme` command.

---

## Requirements

- **Neovim 0.9+**
- **Wayland**: `wl-clipboard` for clipboard support
- Recommended:
  - `ripgrep`, `fd`, `bat`
  - `node`, `npm`, `python3`, `pip` (for LSPs and formatters)

No Nerd Font dependency. No special terminal required.

---

## Philosophy

This is not a theme showcase or a plugin zoo.  
This is a surgical instrument for writing code.  

- Themes are optional
- No wasted CPU cycles
- Every feature is justifiable
- Every keybind is intentional

If Visual Studio is a cruise ship, this is a gunboat.

---

## Plugin Stack

- **Core**: `lazy.nvim`, `telescope.nvim`, `nvim-tree`, `lualine`, `bufferline`
- **Editing**: `autopairs`, `comment.nvim`, `surround.nvim`
- **LSP & Completion**: `nvim-lspconfig`, `nvim-cmp`, `luasnip`, `mason`, `null-ls`
- **Git**: `gitsigns.nvim`, `vim-fugitive`
- **Extras**: Markdown preview, spellcheck, terminal integration

---

## Installation

Clone the repo into your Neovim config directory:

```sh
git clone <your-repo-url> ~/.config/nvim
nvim
```

Plugins will install on first launch.

---

## License

MIT. Fork, extend, break it, whatever.
