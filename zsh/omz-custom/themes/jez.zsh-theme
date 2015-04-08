# jezcope's ZSH Theme (based initially on fishy).

function quilt_prompt_info {
  whence quilt > /dev/null || return
  top_patch=$(quilt top 2>/dev/null)
  [ -n "$top_patch" ] && echo "[%{$fg[yellow]%}$top_patch%{$reset_color%}]"
}

# If vi-mode isn't enabled, make vi_mode_prompt_info a no-op
whence vi_mode_prompt_info > /dev/null || function vi_mode_prompt_info { }

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
PROMPT='(!%{$fg[blue]%}%!%{$reset_color%}) %D{%d-%m-%Y %X} %{$fg[$user_color]%}%~%{$reset_color%}
%{$fg[$user_color]%}%n%{$reset_color%}@%{$fg[cyan]%}%m %{$reset_color%}%(!.#.>) '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='$(vi_mode_prompt_info)${return_status}$(quilt_prompt_info)$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

MODE_INDICATOR="%{$fg[blue]%}<%{$reset_color%}%{$fg[cyan]%}<%{$fg[green]%}<%{$reset_color%}"
