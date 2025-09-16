if type -q fzf
    fzf --fish | source
    # Unbind Ctrl-T to avoid Zellij conflict
    bind -e \ct
    bind -e \cr
    bind -e \ec

    # Rebind Ctrl-Alt-<key> for fzf
    bind ctrl-alt-t fzf-file-widget
    bind ctrl-alt-d fzf-cd-widget
    bind ctrl-alt-h fzf-history-widget

else
    echo "fzf was not installed."
end
