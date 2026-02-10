# # 🌌 Zenith Zsh Theme — A minimal custom prompt with Git info and true-color support.

# # --- ZSH-NATIVE GIT INFO SETUP ---
# # Enable Git info
# autoload -Uz vcs_info

# # Configure vcs_info for speed and detailed output
# # 1. Use '%b' for the branch name.
# # 2. Use '%u' for the 'unstaged' marker (dirty files).
# # 3. Use '%c' for the 'staged' marker (files added to index).
# # 4. Use '-clean' and '-dirty' markers for easy parsing in the prompt function.
# zstyle ':vcs_info:git:*' formats '(%b%u%c)'
# zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
# zstyle ':vcs_info:*' check-for-changes true # This is the crucial performance optimization
# zstyle ':vcs_info:*' unstagedstr '*'
# zstyle ':vcs_info:*' stagedstr '+'
# zstyle ':vcs_info:*' enable git

# # Hook Git info before prompt
# precmd() { vcs_info }

# # Helper: RGB color escape
# rgb() {
#   printf '\e[38;2;%d;%d;%dm' "0x${1:0:2}" "0x${1:2:2}" "0x${1:4:2}"
# }

# # Color definitions (kept the same)
# COLOR_CYAN=21c7c7
# COLOR_PURPLE=AF87FF
# COLOR_GREY=808080
# COLOR_WHITE=FFFFFF
# COLOR_GREEN=87FF5F
# COLOR_RED=FF005F
# COLOR_ORANGE=FF8700
# COLOR_REDDER_PINK=FF8787

# # --- PROMPT DEFINITION (UPDATED) ---
# function print_prompt() {
#   # Reset escape to end colors cleanly
#   local RESET="%f%k%F{reset_color}%K{reset_color}"

#   # Time in [HH:MM:SS PM] format (grey)
#   local TIME="%{$(rgb $COLOR_GREY)%}[$(date +%I:%M:%S\ %p)]"

#   # Username (white)
#   local USER_PROMPT=""
#   [[ -n $USER ]] && USER_PROMPT="%{$(rgb $COLOR_WHITE)%} $USER"

#   # Current directory (if not ~): ":dirname"
#   local DIR_PROMPT=""
#   if [[ $PWD != $HOME ]]; then
#     DIR_PROMPT="%{$(rgb $COLOR_GREY)%}:%{$(rgb $COLOR_CYAN)%}$(basename $PWD)"
#   fi

#   # Git info
#   local GIT_LABEL=""
#   local GIT_PROMPT=""
  
#   # Check if inside a git repo and if vcs_info populated the variable
#   if [[ -n $vcs_info_msg_0_ ]]; then
#     GIT_LABEL="%{$(rgb $COLOR_GREY)%} git:"
    
#     # Check if the vcs_info output contains the dirty markers ('*' or '+')
#     if [[ $vcs_info_msg_0_ == *'*'* || $vcs_info_msg_0_ == *'+'* ]]; then
#       # Dirty repo: Use red
#       GIT_PROMPT="%{$(rgb $COLOR_RED)%}${vcs_info_msg_0_}"
#     else
#       # Clean repo: Use purple
#       GIT_PROMPT="%{$(rgb $COLOR_PURPLE)%}${vcs_info_msg_0_}"
#     fi
#   fi

#   # Separator bar (white)
#   local SEP="%{$(rgb $COLOR_WHITE)%} |"

#   # Combine all parts
#   echo "${TIME}${USER_PROMPT} ${DIR_PROMPT}${GIT_LABEL}${GIT_PROMPT}${SEP} ${RESET}"
# }

# # Set the prompt
# PROMPT='$(print_prompt)'


 ==============================
# Prompt setup
# ==============================
setopt PROMPT_SUBST

# ----------------------
# Safe RGB helper
# ----------------------
rgb() {
  printf '%%{\e[38;2;%d;%d;%dm%%}' \
    "0x${1:0:2}" "0x${1:2:2}" "0x${1:4:2}"
}

RESET="%{\e[0m%}"

# ----------------------
# Colors
# ----------------------
COLOR_GREY=808080
COLOR_CYAN=21c7c7
COLOR_WHITE=FFFFFF
COLOR_PURPLE=AF87FF
COLOR_RED=FF5F5F

# ----------------------
# Cached git state
# ----------------------
GIT_BRANCH=""
GIT_DIRTY=""

update_git_state() {
  GIT_BRANCH=""
  GIT_DIRTY=""

  git rev-parse --is-inside-work-tree &>/dev/null || return

  GIT_BRANCH="$(
    git symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git rev-parse --short HEAD 2>/dev/null
  )"

  git status --porcelain --ignore-submodules=dirty 2>/dev/null | read && GIT_DIRTY=1
}

# ----------------------
# Hooks (run once per command)
# ----------------------
autoload -Uz add-zsh-hook
add-zsh-hook precmd update_git_state
add-zsh-hook chpwd update_git_state

# ----------------------
# Prompt renderer (NO git calls)
# ----------------------
print_prompt() {
  local TIME USER_PROMPT DIR_PROMPT GIT

  # TIME="$(rgb $COLOR_GREY)[$(date +%I:%M:%S\ %p)]"
  TIME="$(rgb $COLOR_GREY)[%D{%I:%M:%S %p}]"
  USER_PROMPT="$(rgb $COLOR_WHITE) $USER"

  DIR_PROMPT=""
  [[ $PWD != $HOME ]] && \
    DIR_PROMPT="$(rgb $COLOR_GREY):$(rgb $COLOR_CYAN)$(basename "$PWD")"

  GIT=""
  if [[ -n $GIT_BRANCH ]]; then
  if [[ -n $GIT_DIRTY ]]; then
    GIT="$(rgb $COLOR_GREY) git:($(rgb $COLOR_RED)${GIT_BRANCH}$(rgb $COLOR_GREY))"
    else
      GIT="$(rgb $COLOR_GREY) git:($(rgb $COLOR_PURPLE)${GIT_BRANCH}$(rgb $COLOR_GREY))"
    fi
  fi

  echo "${TIME}${USER_PROMPT} ${DIR_PROMPT}${GIT} | ${RESET}"
}

PROMPT='$(print_prompt)'
