function fish_prompt
	set -l statussy $pipestatus
	set_color $color_white
	if test $USER != 'Zenith'
		echo -n ' '$USER
	end
	if set -q SSH_TTY
		set_color $color_white
		echo -n '@'
		set_color $color_white
		echo -n $hostname
	end
	set_color $color_pink
	printf ' '
	set -l git_repo_full (git rev-parse --show-toplevel 2> /dev/null)
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
		echo -n ' '$curr_branch
	end
	if set -q fish_private_mode
		set_color $color_grey
		printf ' 󰗹 '
	end
	if test $SHLVL -gt 1
		set_color $color_white
		printf '  '$SHLVL
	end
	set -l stati (count $statussy)
	if test $stati -gt 1
		printf ' '
		for i in (seq $stati)
			if test $i -gt 1
				printf ' '
			end
			if test $statussy[$i] -ne 0
				set_color $color_white
			else
				set_color $color_green
			end
			printf $statussy[$i]
		end
	else
		if test $statussy -ne 0
			set_color $color_red
			printf ' ✘%s' $statussy
		end
	end
	set_color $color_cyan
	# printf '\n╰─❯ '
	printf '\n╰─'
	set_color $color_white
	printf '❯'
	set_color normal
end
# function fish_mode_prompt
# 	# set_color $color_yellow
# 	switch $fish_bind_mode
# 		case insert
# 			echo '󰼁'
# 		case '*'
# 			echo ''
# 	end
# end
# funcsave fish_mode_prompt > /dev/null