# Neovim Configuration — Fast. Functional. Ruthlessly Efficient.

This is a lean, keyboard-driven Neovim setup for developers who care about performance and control. Faster than Visual Studio. Less bloated than Emacs. Sharper than your average IDE.

Themes? Optional. Nerdfonts? Not required. This config focuses on precision and simplicity without sacrificing power. Feature-rich without compromising performance and efficiency.

<img width="1920" height="1036" alt="nvimenvironment" src="https://github.com/user-attachments/assets/fae864d7-e94c-422b-9187-6f45b94e3535" />

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
- oxocarbon
  <img width="1892" height="1031" alt="oxocarbon" src="https://github.com/user-attachments/assets/9fb71c56-47ad-41ca-8298-1c4a96ba1610" />
- gruvbox
  <img width="1887" height="1027" alt="gruvbox" src="https://github.com/user-attachments/assets/27cdf544-2eb9-48d2-9872-3775acb4d91e" />
- everforest
  <img width="1891" height="1023" alt="everforest" src="https://github.com/user-attachments/assets/48c332ff-4d40-4b71-9a88-c471fcc4696e" />
- tokyonight
  <img width="1891" height="1032" alt="tokyonight" src="https://github.com/user-attachments/assets/308a0429-4f02-4892-9235-93749157a8e7" />
- tokyonightmoon
  <img width="1891" height="1028" alt="tokyomoon" src="https://github.com/user-attachments/assets/106eb8fb-3419-4491-b82b-2cb75000bd65" />
- catpuccin
  <img width="1891" height="1032" alt="catpuccin" src="https://github.com/user-attachments/assets/344075a3-d7a5-4a98-9d4a-735bdce6a6e3" />
- dracula
  <img width="1891" height="1028" alt="dracula" src="https://github.com/user-attachments/assets/c8dff805-a844-435f-a434-53a710d48c40" />
- monokai
  <img width="1887" height="1026" alt="monokai" src="https://github.com/user-attachments/assets/37a34252-8693-4b4a-bad2-7b88f4d677e7" />
- nord
  <img width="1885" height="1027" alt="nord" src="https://github.com/user-attachments/assets/486b2773-2d29-4299-9150-317a5f246c7e" />
- solarized
  <img width="1887" height="1025" alt="solarized" src="https://github.com/user-attachments/assets/14bfb6dd-6127-4ae3-8c8e-71e8741ea646" />

### Homebrew Themes:
- aperture
  <img width="1890" height="1028" alt="aperture" src="https://github.com/user-attachments/assets/eda236af-b0e3-4b91-9b54-1c428e34cb0e" />
- nebula
  <img width="1892" height="1028" alt="nebula" src="https://github.com/user-attachments/assets/ee269b1a-d509-47f2-b65e-6690eb66fd48" />
- verdant
  <img width="1892" height="1027" alt="verdant" src="https://github.com/user-attachments/assets/54545dae-9b29-42a5-ae38-44547ac5a9e5" />
- sapphire
  <img width="1887" height="1026" alt="sapphire" src="https://github.com/user-attachments/assets/93b70d90-ce17-41cd-8b0b-8ced27ef74ab" />
- ronin
  <img width="1888" height="1030" alt="ronin" src="https://github.com/user-attachments/assets/45d5fd74-8eda-4b2c-ab29-bd528df12865" />
- claret
  <img width="1890" height="1031" alt="claret" src="https://github.com/user-attachments/assets/8de19086-3010-4b9d-a1ca-1511bddccb10" />
- bloodsport
  <img width="1887" height="1023" alt="Bloodsport" src="https://github.com/user-attachments/assets/067d448d-69a4-4c76-9815-f81eac3412f4" />
- cafe
  <img width="1895" height="1031" alt="cafe" src="https://github.com/user-attachments/assets/a8619124-96f1-4f68-ab79-5c70a2950204" />
- cafeexpresso
  <img width="1890" height="1029" alt="cafeexpresso" src="https://github.com/user-attachments/assets/83aebc13-8cad-4516-be94-ee34f18a190d" />
- matcha
  <img width="1890" height="1028" alt="matcha" src="https://github.com/user-attachments/assets/73dfc82e-7d58-474d-b9b2-188c273253b8" />
- matchamoon
  <img width="1890" height="1027" alt="matchamoon" src="https://github.com/user-attachments/assets/af31c404-315f-4edb-9773-bba49d57247b" />

Theme cycling is handled with `<C-t>`, and manual selection uses the `:SetTheme` command. Because of how jank neovim is at times when you switch to a theme you should restart neovim

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
