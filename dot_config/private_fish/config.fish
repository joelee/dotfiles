if status is-interactive
    # Commands to run in interactive sessions can go here
    if test "$TERM" = xterm-kitty; and type -q zellij; and not set -q ZELLIJ; and not set -q TMUX; and not set -q SSH_TTY
        if set -q KITTY_SESSION; and test -n "$KITTY_SESSION"
            # Attach/create the session named by KITTY_SESSION
            exec zellij attach --create "$KITTY_SESSION"
        else
            # No KITTY_SESSION provided: print active sessions (if any), then continue normally
            set -l _zs (zellij list-sessions 2>/dev/null)
            if test (count $_zs) -gt 0
                echo
                echo "Active Zellij sessions:"
                for _line in $_zs
                    echo "    - $_line"
                end
                echo
            end
        end
    end
end
