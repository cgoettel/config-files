function precmd {
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

  # Truncate the path if it's too long.
  PR_FILLBAR=""
  PR_PWDLEN=""

  local promptsize=${#${git_prompt_info}:---:--:--}
  local pwdsize=${#${(%):-%~}}
  # local gitsize=${#${git_prompt_info}}

  if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
  else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize))).. .)}"
  fi
}

# See if we can use colors.
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
done

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} \ue0a0"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} \ue0a0"

# Finally, the prompt.
PROMPT='$PR_BLUE\
%$PR_PWDLEN<...<%~%<<\
${(e)PR_FILLBAR}\
$PR_BLUE%*
${ret_status}%{$reset_color%} '

RPROMPT='$(git_prompt_info)'