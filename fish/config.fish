set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx __GL_SHADER_DISK_CACHE_SKIP_CLEANUP 1
set -gx PGHOST /tmp
set -gx GTK_THEME Adwaita:dark

systemctl --user set-environment DISPLAY=:0.0
systemctl --user restart opentabletdriver.service

xset r rate 170

pyenv init - | source

alias opacity "pkill picom ; sleep 0.1 ; picom -b --active-opacity 0.9"
alias nopacity "pkill picom ; sleep 0.1"
alias lumari "proton ~/.local/share/proton-pfx/0/pfx/drive_c/Progam\ Files/Proxima/Lumari"
alias pureref "PureRef"
alias lock "xscreensaver-command -lock"
alias firefopsie "firefox"
alias fops "firefox"
alias nvim-kickstart "NVIM_APPNAME='nvim-kickstart' nvim"
alias nvim-test "NVIM_APPNAME='nvim-test' nvim"

fish_add_path "$HOME/.elan/bin"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$HOME/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    # if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
    # end
end

# Created by `pipx` on 2023-10-17 03:08:43
set PATH $PATH /home/phoenix/.local/bin
