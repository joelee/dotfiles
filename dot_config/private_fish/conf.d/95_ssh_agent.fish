# Run ssh-agent once
#  [!] Do not run this on a multi-user system.

if test -e $HOME/.bitwarden-ssh-agent.sock
    set -ge SSH_AUTH_SOCK
    set -Ux SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock
else if test -e $HOME/.ssh/id_ed25519
    if test -z "$(pgrep ssh-agent)"
        eval (ssh-agent -c)
        set -ge SSH_AUTH_SOCK
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        echo "export SSH_AUTH_SOCK=\"$SSH_AUTH_SOCK\"" >$HOME/.ssh/set-env
        echo "export SSH_AUTH_PID=\"$SSH_AGENT_PID\"" >>$HOME/.ssh/set-env
        echo "set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK" >$HOME/.ssh/set-env.fish
        echo "set -Ux SSH_AGENT_PID $SSH_AGENT_PID" >>$HOME/.ssh/set-env.fish
        echo "New SSH Agent: $SSH_AGENT_PID"
    else
        echo "SSH Agent found: $SSH_AGENT_PID"
        if test -e $HOME/.ssh/set-env.fish
            set -ge SSH_AUTH_SOCK
            source $HOME/.ssh/set-env.fish
        end
    end
end
