function asdf_enable
    # ASDF configuration code
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # Do not use fish_add_path (added in Fish 3.2) because it
    # potentially changes the order of items in PATH
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
        echo "ASDF path prepended into PATH"
    end
    set --erase _asdf_shims
end

function asdf_disable

    # ASDF configuration code
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    if set -l index (contains -i $_asdf_shims $PATH)
        set -eg PATH[$index]
        echo "ASDF disabled"
    else
        echo "ASDF was not enabled"
    end
    set --erase _asdf_shims
end
