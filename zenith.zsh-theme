# 🌌 Zenith Zsh Theme — A minimal custom prompt with Git info and true-color support.

# Enable Git info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# Hook Git info before prompt
precmd() { vcs_info }

# Helper: RGB color escape
rgb() {
  printf '\e[38;2;%d;%d;%dm' "0x${1:0:2}" "0x${1:2:2}" "0x${1:4:2}"
}

# Color definitions
COLOR_CYAN=21c7c7
COLOR_PURPLE=AF87FF
COLOR_GREY=808080
COLOR_WHITE=FFFFFF
COLOR_GREEN=87FF5F
COLOR_RED=FF005F
COLOR_ORANGE=FF8700
COLOR_REDDER_PINK=FF8787

# Prompt definition
function print_prompt() {
  # Reset escape to end colors cleanly
  local RESET="%f%k%F{reset_color}%K{reset_color}"

  # Time in [HH:MM] format (grey)
  local TIME="%{$(rgb $COLOR_GREY)%}[$(date +%I:%M:%S\ %p)]"

  # Username (white)
  local USER_PROMPT=""
  [[ -n $USER ]] && USER_PROMPT="%{$(rgb $COLOR_WHITE)%} $USER"

  # Current directory (if not ~): ":dirname"
  local DIR_PROMPT=""
  if [[ $PWD != $HOME ]]; then
    DIR_PROMPT="%{$(rgb $COLOR_GREY)%}:%{$(rgb $COLOR_CYAN)%}$(basename $PWD)"
  fi

  # Git info
  local GIT_LABEL=""
  local GIT_PROMPT=""
  
  # Check if inside a git repo
  if [[ -n $vcs_info_msg_0_ ]]; then
    GIT_LABEL="%{$(rgb $COLOR_GREY)%} git:"
    
    # Check if the repository is dirty (has uncommitted changes)
    if git diff --quiet 2>/dev/null; then
      # Clean repo: Use purple
      GIT_PROMPT="%{$(rgb $COLOR_PURPLE)%}${vcs_info_msg_0_}"
    else
      # Dirty repo: Use red
      GIT_PROMPT="%{$(rgb $COLOR_RED)%}${vcs_info_msg_0_}"
    fi
  fi

  # Separator bar (white)
  local SEP="%{$(rgb $COLOR_WHITE)%} |"

  # Combine all parts
  echo "${TIME}${USER_PROMPT} ${DIR_PROMPT}${GIT_LABEL}${GIT_PROMPT}${SEP} ${RESET}"
}

# Set the prompt
PROMPT='$(print_prompt)'