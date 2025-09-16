set -x LANG en_US.UTF-8

# Chezmoi one-line command installed itself here
if test -e $HOME/bin
    fish_add_path $HOME/bin
end

# This Dotfiles install useful utilities here
if test -e $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

# Homebrew package manager
if test -e /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
    set -Ux HOMEBREW_AUTO_UPDATE_SECS 3600
end

# Nix & Home Manager
if test -e /nix/var/nix/profiles/default/bin
    fish_add_path /nix/var/nix/profiles/default/bin
end
if test -e $HOME/.nix-profile/bin
    fish_add_path $HOME/.nix-profile/bin
end
