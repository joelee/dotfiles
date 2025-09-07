set -ge EDITOR

if type -q hx
    set -Ux EDITOR hx
else if type -q helix
    set -Ux EDITOR helix
else if type -q nvim
    set -Ux EDITOR nvim
else if type -q vim
    set -Ux EDITOR vim
end
