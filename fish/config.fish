# #  /mnt/c/users/Zenith

# # set -g tide_left_prompt_frame_enabled true
set -gx LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:di=37:fi=37:ex=37"
set -gx EDITOR 'nvim'
set -gx VISUAL 'nvim'






set -g color_pink        21c7c7
set -g color_purple      AF87FF
set -g color_grey        878787
set -g color_white       FFFFFF     
set -g color_green       87FF5F
set -g color_cyan        00D7FF
set -g color_red         FF005F
set -g color_orange      FF8700
set -g color_redder_pink FF8787
set -g color_grey       D4BE98


set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block



# gruvbox theme configuration

set -g color_gruvbox_white  D4BE98
set -g color_gruvbox_green  A9B665
set -g color_gruvbox_purple D3869B
set -g color_gruvbox_orange E78A4E
set -g color_gruvbox_yellow D8A657
set -g color_gruvbox_red    EA6962
set -g color_gruvbox_sea    89B482
set -g color_gruvbox_grey   928374
set -g color_gruvbox_cyan   7DAEA3


set -g fish_lazy_load_completions 'true'
set -g fish_lazy_load_functions 'true'
set -g fish_escape_delay_ms 10
set -g pisces_only_insert_at_eol 1


set -g fish_color_normal $color_gruvbox_white
set -g fish_color_command $color_gruvbox_green
set -g fish_color_quote $color_gruvbox_yellow
set -g fish_color_redirection $color_gruvbox_orange
set -g fish_color_end $color_gruvbox_orange
set -g fish_color_error $color_gruvbox_red
set -g fish_color_param $color_gruvbox_cyan
set -g fish_color_comment $color_gruvbox_grey
set -g fish_color_match $color_gruvbox_purple
set -g fish_color_operator $color_gruvbox_purple
set -g fish_color_escape $color_gruvbox_grey
set -g fish_color_autosuggestion $color_gruvbox_grey



#abbreviations----
abbr -a g     'git'
abbr -a gd    'git diff'
abbr -a giti  'git init'
abbr -a gss   'git status'
abbr -a gs    'git status -s'
abbr -a gsh   'git show'
abbr -a gl    'git log'
abbr -a glo   'git log --oneline'
abbr -a ga    'git add'
abbr -a gap   'git add -p'
abbr -a gm    'git commit'
abbr -a gma   'git commit --amend'
abbr -a gman  'git commit --amend --no-edit'
abbr -a gp    'git push'
abbr -a gpo   'git push origin'
abbr -a grs   'git reset'
abbr -a grsH  'git reset HEAD'
abbr -a grsh  'git reset --hard'
abbr -a grshH 'git reset --hard HEAD'
abbr -a gst   'git stash'
abbr -a gsts  'git stash push -q'
abbr -a gstp  'git stash pop -q'
abbr -a gsta  'git stash apply -q'
abbr -a gstl  'git stash list'
abbr -a gstd  'git stash drop'
abbr -a gstc  'git stash clear'
abbr -a grt   'git restore'
abbr -a grts  'git restore --staged'
abbr -a gch   'git checkout'
abbr -a gb    'git branch'
abbr -a gme   'git merge'
abbr -a gre   'git remote'
abbr -a gcl   'git clean -id'
abbr -a gclf  'git clean -df'
abbr -a gcf   'git config'
abbr -a gcfg  'git config --global'
abbr -a gsw   'git switch'
abbr -a gf    'git fetch'
abbr -a gpu   'git pull'
abbr -a grm   'git rm'

abbr -a gmap 'git commit --amend &&
	git push'
abbr -a gmanp 'git commit --amend - &&-no-edit
	git push'
abbr -a gmp 'git commit &&
	git push'
abbr -a gam 'git add . &&
	git commit -a'
abbr -a gamn 'git add . &&
	git commit -a --no-edit'
abbr -a gamp 'git add . &&
	git commit -a &&
	git push'
abbr -a gamap 'git add . &&
	git commit -a --amend &&
	git push'
abbr -a gamanp 'git add . &&
	git commit -a --amend --no-edit &&
	git push'
abbr -a gamanpf 'git add . &&
	git commit -a --amend --no-edit &&
	git push -f'
abbr -a gaman 'git add . &&
	git commit -a --amend --no-edit'
abbr -a gcr 'git add . &&
	git commit -m "first commit" &&
	git push -u origin main'



abbr -a ghr     'gh repo'
abbr -a ghrd    'gh repo delete --yes'
abbr -a ghrl    'gh repo list -L 1000'
abbr -a ghrcl   'gh repo clone'
abbr -a ghrf    'gh repo fork'
abbr -a ghrv    'gh repo view'
abbr -a ghre    'gh repo edit'
abbr -a ghrr    'gh repo rename'
abbr -a ghrcu   'gh repo create --public'
abbr -a ghrcuM  'gh repo create --public --license MIT'
abbr -a ghrcp   'gh repo create --private'
abbr -a ghrcpM  'gh repo create --private --license MIT'
abbr -a ghrccu  'gh repo create --clone --public'
abbr -a ghrccuM 'gh repo create --clone --public --license MIT'
abbr -a ghrccp  'gh repo create --clone --private'
abbr -a ghrccpM 'gh repo create --clone --private --license MIT'
abbr -a ghg     'gh gist'
abbr -a ghgc    'gh gist create'
abbr -a ghi     'gh issue'
abbr -a ghil    'gh issue list'
abbr -a ghiv    'gh issue view'
abbr -a ghal    'gh auth login'
abbr -a ghpr    'gh pr'
abbr -a ghprc   'gh pr create'

abbr -a cls 'clear'
abbr -a clx 'clear -x'



abbr -a rm  'trash-put'
abbr -a rmf 'rm -fr'
abbr -a trr 'trash-restore'

#alias
alias ls "exa -a --icons"
alias ll='exa -l --icons --no-user --group-directories-first  --time-style long-iso'
alias n nvim
alias exp "explorer.exe ."
alias zen " cd /mnt/c/Users/Zenith"
alias config "cd /mnt/c/Users/Zenith/.config"
alias dev "cd /mnt/c/Users/Zenith/Dev/" 
# for opening vscode in windows machin

# abbr -a ls  'exa -a --icons'
# abbr -a lst 'exa -a --icons --tree'
# abbr -a ll 'exa -l --icons --no-user --group-directories-first  --time-style long-iso'


abbr -a v 'nvim'
abbr -a vf 'commandline "nvim "(fzf) ; commandline -f execute'
abbr -a codef 'commandline "code "(fzf) ; commandline -f execute'
abbr -a fp 'fish -P'



# fzf

bind -M insert \cD paste_important_path
bind -M insert \cF paste_parent_path
bind -M insert \cS paste_relative_path


