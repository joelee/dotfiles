if type -q fnm
    eval "$(fnm env)"
else
    echo "fnm (Fast Node Manager) was not installed"
end
