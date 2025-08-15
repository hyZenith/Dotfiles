function fish_prompt
    set_color brblack
	echo -n "["(date "+%H:%M")"]"
	set_color $color_white
	if test $USER != ''
		echo -n ' '$USER
	end
	set_color $color_cyan
	printf ' '

	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color $color_cyan
		echo -n (basename $PWD)
	end
	set_color $color_purple
	printf '%s ' (__fish_git_prompt)


	set_color $color_white
	printf '| '
	# printf '\n╰─❯ '
	# printf '\n╰─'
	# set_color $color_white
	# printf '❯'
	# set_color normal
end

