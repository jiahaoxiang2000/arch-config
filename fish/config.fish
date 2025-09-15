# Commands to run in interactive sessions can go here
# Set environment variables for IBus to work properly with Electron apps like VSCode
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x QT_FONT_DPI 120 
set -x QT_SCALE_FACTOR 0.8
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
# source ~/.profile

# add cargo bin to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# add nvim to PATH
set -gx PATH /opt/nvim-linux-x86_64/bin $PATH

# Created by `pipx` on 2025-05-25 01:59:15
set PATH $PATH /home/isomo/.local/bin

# proxy split by the application
function claude
    set -lx HTTPS_PROXY "http://127.0.0.1:1080"
    set -lx HTTP_PROXY "http://127.0.0.1:1080"
    ~/.local/bin/claude $argv
end

function claude-deepseek
    source ~/.token
    set -lx ANTHROPIC_AUTH_TOKEN $DEEPSEEK_AUTH_TOKEN
    set -lx ANTHROPIC_BASE_URL "https://api.deepseek.com/anthropic"
    set -lx ANTHROPIC_MODEL "deepseek-chat"
    set -lx ANTHROPIC_SMALL_FAST_MODEL "deepseek-chat"
    ~/.local/bin/claude $argv
end

function claude-kimi
    source ~/.token
    set -lx ANTHROPIC_AUTH_TOKEN $KIMI_AUTH_TOKEN
    set -lx ANTHROPIC_BASE_URL "https://api.moonshot.cn/v1"
    set -lx ANTHROPIC_MODEL "kimi-k2-0905-preview"
    set -lx ANTHROPIC_SMALL_FAST_MODEL "kimi-k2-0905-preview"
    ~/.local/bin/claude $argv
end

function claude-bigmodel
    source ~/.token
    set -lx ANTHROPIC_AUTH_TOKEN $BIGMODEL_AUTH_TOKEN
    set -lx ANTHROPIC_BASE_URL "https://open.bigmodel.cn/api/anthropic"
    set -lx ANTHROPIC_MODEL "GLM-4.5"
    set -lx ANTHROPIC_SMALL_FAST_MODEL "GLM-4.5-Air"
    ~/.local/bin/claude $argv
end

function godot
    command godot --display-driver wayland $argv
end
