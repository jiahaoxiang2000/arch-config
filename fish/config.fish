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

# proxy settings
# set -x HTTPS_PROXY "http://127.0.0.1:1080"
# set -x HTTP_PROXY "http://127.0.0.1:1080"
# set -x NO_PROXY "localhost,127.0.0.1,::1"

# source the ~/.profile file, some key is on the ~/.profile
# source ~/.profile

# add cargo bin to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# add nvim to PATH
set -gx PATH /opt/nvim-linux-x86_64/bin $PATH

# Created by `pipx` on 2025-05-25 01:59:15
set PATH $PATH /home/isomo/.local/bin

# SSH tunnel startup - check if tunnel is already running before starting
# if not pgrep -f "ssh -N -L 0.0.0.0:1080:127.0.0.1:1080 ubuntu@43.139.157.97" > /dev/null
#     nohup ssh -N -L 0.0.0.0:1080:127.0.0.1:1080 ubuntu@43.139.157.97 -i ~/.ssh/id_github >/dev/null 2>&1 &
# end
