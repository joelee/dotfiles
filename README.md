# joelee Dotfiles

[![chezmoi](https://img.shields.io/badge/managed%20with-chezmoi-00A0FF.svg)](https://www.chezmoi.io/)
![License](https://img.shields.io/badge/license-MIT-blue)

This repository contains my personal `Dotfiles`, managed using [chezmoi](https://www.chezmoi.io/).

---

## 🗂️ What are `Dot files`?
Dotfiles are plain-text configuration files on Unix-like systems (macOS, Linux, BSD, etc.) that control how applications, shells, editors, and tools behave. By version-controlling them, you can:

- **Customise your environment** → Tailor your shell, editor, and terminal experience.
- **Stay consistent across machines** → Clone this repo and instantly set up a familiar development environment anywhere.
- **Track changes** → Manage updates and experiment with new tools safely using Git.
- **Automate setup** → Save hours when setting up a new laptop, VM, or container.

---

## 🔧 Why chezmoi?
I use [chezmoi](https://www.chezmoi.io/) to securely manage and apply these `dotfiles` across multiple systems. Chezmoi provides:

- Encrypted secret management.
- Cross-platform support (macOS, Linux, Windows via WSL).
- Easy initial setup on a fresh machine with a single command.

---

## 📂 What’s Inside
Some highlights of what are the included configurations:

- 🐚 **Fish Shell** customisations with completions and plugins + aliases.
- ✨ **Starship prompt** for a fast, informative shell experience.
- 🧪 My custom **Neovim** IDE configuration (LazyVim-based config).
- 🖥️ Terminal: **Alacritty** & **Kitty**
- 🧩 Development environments for **Python**, **Rust**, **Go**. and **Node.js**.
- 🧰 CLI Tools: `fzf`, `zoxide`, `direnv`, `eza`, `docker`, and [lots more](dot_config/private_fish/conf.d)...
- 🪟 MacOS Tiling Window Management: **Amethyst** layouts.
- ⌨️ **Kanata** custom keyboard layout to support **Home row mods**
- 🗄️ **Git** configuration tuned for project-based identities.
- 📦 Package Management: **Homebrew** (Brewfile)

---

## 🚀 One Line Quick Start!
To set up these `Dotfiles` on your machine, run:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --prompt --apply joelee
```
This will:
1. Install chezmoi (if not already installed).
2. Clone this repository.
3. Apply all dotfiles into your `$HOME` directory.
4. On MacOS: install Homebrew if it is not installed and [all the packages](dot_config/Brewfile)
5. Install and activate the Fish shell

> ⚠️ I recommend you to fork this project to your own repository, so that you can customised it to suit your workflow.
> For more customised configuration. see the instructions below...

---

## 🚀 Quick Start (for New Mac)
If you do not want to run an external script one line command above, you can set up these `Dotfiles` manually:

1. Install [Homebrew](https://brew.sh/) (if you don't have it).
2. Install chezmoi: `brew install chezmoi`
3. Pull & apply my dotfiles in one go: `chezmoi init --prompt --apply joelee`
4. Sanity check: `chezmoi doctor`
5. Restart your Terminal

---

## 🚀 Quick Start (for New Arch-based Linux)
> 🚧 _Coming Soon..._

---

## 🙌 Why I Publish My Dotfiles

I believe in knowledge sharing and the open-source spirit. Publishing my `dotfiles` allows me to:

- **Document my setup** so I can reproduce it anywhere.
- **Help others** who are looking for inspiration to build or refine their own environments.
- **Learn and improve** by getting feedback and discovering better practices from the community.
- **Promote automation** — because a repeatable environment saves time and reduces friction.

If something here helps you speed up your workflow, that’s a win.

---

## 🔗 Helpful Links

- [chezmoi Documentation](https://www.chezmoi.io/)
- [Homebrew: Package Manager for MacOS](https://brew.sh/)

---

## 📜 License
This repository is licensed under the [MIT License](LICENSE).

---

👉 Feel free to fork, adapt, or suggest improvements. Your `Dotfiles` should reflect your workflow — this repo is just one example.

---
