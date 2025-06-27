# Commands to run in interactive sessions can go here
# Set environment variables for IBus to work properly with Electron apps like VSCode
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x QT_FONT_DPI 120 
# Custom date format function - formats date in YYYY-MM-DD HH:MM:SS TZ format (24-hour, no weekday)
function mydate
    date +"%Y-%m-%d %H:%M:%S %Z"
end

# Quick translation to Chinese function
function tozh
    trans-cli "$argv"
end

function toen
    trans-cli -f zh -t en "$argv"
end

# node version manager
if type -q fnm
    fnm env | source
end

# Load Homebrew environment on macOS
if test (uname) = "Darwin"
    if test -f /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end
end

# mirror for node and npm
set -x FNM_NODE_DIST_MIRROR https://npmmirror.com/mirrors/node
set -x NPM_CONFIG_REGISTRY https://registry.npmmirror.com

# source the ~/.profile file, some key is on the ~/.profile
source ~/.profile

# add cargo bin to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# Created by `pipx` on 2025-05-25 01:59:15
set PATH $PATH /home/isomo/.local/bin
