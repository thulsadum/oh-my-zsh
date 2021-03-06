function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '%#'
}

function repo {
    git branch >/dev/null 2>/dev/null && git rev-parse --show-toplevel && return
    hg root >/dev/null 2>/dev/null && hg root && return
}

function repo_prompt {
	if [ "$(repo)" != "" ]; then
		echo " in repository %{$fg[magenta]%}$(repo)%{$reset_color%}"
	fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function pacman_updates {
	UPS=`pacman -Qqu|wc -l`
	if [ "$UPS" != "0" ]; then
		echo "[ updates avaible: $UPS ] "
	fi
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} $(pacman_updates)in %{$fg_bold[green]%}%~%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)$(repo_prompt)
$(virtualenv_info)$(prompt_char) '

#RPROMPT='$(rvm_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
