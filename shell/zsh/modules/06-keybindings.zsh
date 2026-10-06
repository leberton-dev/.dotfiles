#!/usr/bin/env zsh

bindkey -v

if [[ -n "$SCRIPTS" && -f "$SCRIPTS/utils/tmux-sessionizer" ]]; then
	bindkey -s '^f' "$SCRIPTS/utils/tmux-sessionizer\n"
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

for keymap in viins vicmd; do
	bindkey -M $keymap '^[[A' up-line-or-beginning-search
	bindkey -M $keymap '^[[OA' up-line-or-beginning-search
	bindkey -M $keymap '^[[B' down-line-or-beginning-search
	bindkey -M $keymap '^[[OB' down-line-or-beginning-search
done

bindkey -M vicmd 'k' up-line-down-search
bindkey -M vicmd 'j' down-line-down-search
