if status is-interactive
    # Commands to run in interactive sessions can go here
    # Set environment variables for IBus to work properly with Electron apps like VSCode
    set -x GTK_IM_MODULE ibus
    set -x QT_IM_MODULE ibus
    set -x XMODIFIERS @im=ibus
end

