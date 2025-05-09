if status is-interactive
    # Commands to run in interactive sessions can go here
end
if status --is-interactive
    and not ssh-agent > /dev/null; 
    ssh-agent -c | source
end

# starship init fish | source
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"


set -g color_cyan        21c7c7
set -g color_purple      AF87FF
set -g color_grey        808080
set -g color_white       FFFFFF     
set -g color_green       87FF5F
# set -g color_cyan        00D7FF
set -g color_red         FF005F
set -g color_orange      FF8700
set -g color_redder_pink FF8787

# Alias 
alias  gucse 'cd /mnt/c/Users/Zenith/Documents/gucse'
alias workspace 'cd /mnt/c/Users/Zenith/workspace'
alias zenith 'cd /mnt/c/Users/Zenith'
alias subl '"/mnt/c/Program Files/Sublime Text/subl.exe"'
