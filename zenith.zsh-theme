
# 🌌 Zenith Zsh Theme — A minimal custom prompt with Git info and true-color support.

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

# caching guards
LAST_PWD=""
LAST_HEAD=""

# ----------------------
# Ultra-fast git state updater
# ----------------------
update_git_state() {
  # quick exit if not inside repo
  local gitdir
  gitdir=$(git rev-parse --git-dir 2>/dev/null) || {
    GIT_BRANCH=""
    GIT_DIRTY=""
    return
  }

  # get current HEAD (cheap)
  local head
  head=$(git rev-parse HEAD 2>/dev/null) || return

  # skip recompute if nothing changed
  if [[ "$PWD" == "$LAST_PWD" && "$head" == "$LAST_HEAD" ]]; then
    return
  fi

  LAST_PWD="$PWD"
  LAST_HEAD="$head"

  # branch name (cheap)
  GIT_BRANCH="$(
    git symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git rev-parse --short HEAD 2>/dev/null
  )"

  # dirty check (fast — no git status)
  # checks index and working tree differences only
  GIT_DIRTY=""
  git diff-index --quiet HEAD -- 2>/dev/null || GIT_DIRTY=1
}

# ----------------------
# Hooks
# ----------------------
autoload -Uz add-zsh-hook
add-zsh-hook precmd update_git_state
add-zsh-hook chpwd update_git_state

# ----------------------
# Prompt renderer (NO git calls here)
# ----------------------
print_prompt() {
  local TIME USER_PROMPT DIR_PROMPT GIT

  TIME="$(rgb $COLOR_GREY)[%D{%I:%M:%S %p}]"
  USER_PROMPT="$(rgb $COLOR_WHITE) $USER"

  DIR_PROMPT=""
  [[ $PWD != $HOME ]] && \
    DIR_PROMPT="$(rgb $COLOR_GREY):$(rgb $COLOR_CYAN)${PWD:t}"

  GIT=""
  if [[ -n $GIT_BRANCH ]]; then
    if [[ -n $GIT_DIRTY ]]; then
      GIT="$(rgb $COLOR_GREY) git:($(rgb $COLOR_RED)${GIT_BRANCH}$(rgb $COLOR_GREY))"
    else
      GIT="$(rgb $COLOR_GREY) git:($(rgb $COLOR_PURPLE)${GIT_BRANCH}$(rgb $COLOR_GREY))"
    fi
  fi

  echo "${TIME}${USER_PROMPT}${DIR_PROMPT}${GIT} | ${RESET}"
}

PROMPT='$(print_prompt)'
