##################
# Helix Editor
##################

if type -q helix
    if not type -q hx
        alias hx=helix
    end

    # Prefer Helix over any other editors
    alias vi=helix
    alias nano=helix
end
