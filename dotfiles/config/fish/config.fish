if status is-interactive

    # Install Fisher
    if not test -f {$HOME}/.config/fish/functions/fisher.fish
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

        fisher install IlanCosman/tide@v6
    end

end

# Theme
source {$HOME}/.config/fish/themes/el_jefe.fish

