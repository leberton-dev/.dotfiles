#!/usr/bin/env zsh

DOTFILES_DIR="$HOME/.dotfiles"

for module in "$DOTFILES_DIR"/shell/zsh/modules/*.zsh; do
	if [[ -r "$module" ]]; then
		source "$module"
	fi
done

eval "$(starship init zsh)"

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
[[ -f "$DOTFILES_DIR/local/.zshrc.$OS" ]] && source "$DOTFILES_DIR/local/.zshrc.$OS"

unset DOTFILES_DIR
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# Load Homebrew config script
source $HOME/.brewconfig.zsh

# mya: lock the terminal while a task is overdue
if [[ -o interactive ]] && (( $+commands[mya] )); then
	trap '' INT
	while mya task check; (( $? == 3 )); do
		print "terminal locked: only mya commands allowed (e.g. 'done poubelles'), Ctrl+D to quit"
		read -r "line?mya task> " || exit
		mya task ${(Q)${(z)line}}
	done
	trap - INT
fi
