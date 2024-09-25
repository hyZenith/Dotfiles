function fish_prompt
	set_color $color_white
	if test $USER != ''
		echo -n ' '$USER
	end
	set_color $color_pink
	printf ' '
	if test $git_repo_full
		set -l git_repo (basename $git_repo_full)
		set -l not_git_repo (string replace $git_repo '' $git_repo_full)
		printf (string replace "$not_git_repo" '' $PWD)
	else
		set -l home (string escape --style=regex $HOME)
		set -l cwd (string replace -r "^$home" '~' $PWD)
		set -l base (basename $cwd)
		printf $base
	end
	set -l curr_branch (git branch --show-current 2> /dev/null)
	if test curr_branch
		set_color $color_purple
		echo -n ' '$curr_branch
	end
	set_color $color_white
	# printf '\n╰─❯ '
	printf '\n╰─'
	set_color $color_white
	printf '❯'
	set_color normal
end

