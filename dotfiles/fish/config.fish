if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/derek/miniconda3/bin/conda
    eval /home/derek/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/derek/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/derek/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/derek/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

set -U fish_user_paths ~/.config/emacs/bin $fish_user_paths
starship init fish | source
set fish_greeting ''
#set -U fish_user_paths /home/derek/Documents/repos/private/slizzbop $fish_user_paths
set -Ux PATH $HOME/usr/bin/rust-analyzer $PATH

set -U PATH /opt/android-sdk/platform-tools $PATH
