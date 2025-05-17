if status is-interactive
    # Commands to run in interactive sessions can go here
    # Set environment variables for IBus to work properly with Electron apps like VSCode
    set -x GTK_IM_MODULE fcitx
    set -x QT_IM_MODULE fcitx
    set -x XMODIFIERS @im=fcitx
end

# Custom date format function - formats date in YYYY-MM-DD HH:MM:SS TZ format (24-hour, no weekday)
function mydate
    date +"%Y-%m-%d %H:%M:%S %Z"
end

# Quick translation to Chinese function
function tozh
    trans -x 127.0.0.1:7897 -4 :zh "$argv"
end

