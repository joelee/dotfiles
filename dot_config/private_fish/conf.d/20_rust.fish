if type -q rustup
    if test -d "$HOME/.rustup/bin"
        fish_add_path "$HOME/.rustup/bin"
    else
        fish_add_path "$(dirname $(rustup which rustc))"
    end
end

if test -e "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
else if test -e "$HOME/.cargo/bin"
    fish_add_path -p "$HOME/.cargo/bin"
end
