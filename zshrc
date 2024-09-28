# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/antigen.zsh

antigen init ~/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/workspace/dotfiles/p10k.zsh.
[[ ! -f ~/workspace/dotfiles/p10k.zsh ]] || source ~/workspace/dotfiles/p10k.zsh

fpath+=$HOME/.zsh_functions

path+=/opt/bin
path+=$HOME/.local/bin
path+=$HOME/.local/share/coursier/bin
path+=$HOME/go/bin

# prepend
path=('/usr/local/go/bin' $path)
export PATH

export GO_HOME=/usr/local/go

alias gpsom='git push origin main'
alias gplom='git pull origin main'

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# To customize prompt, run `p10k configure` or edit /opt/workspace/dotfiles/p10k.zsh.
[[ ! -f /opt/workspace/dotfiles/p10k.zsh ]] || source /opt/workspace/dotfiles/p10k.zsh

# For gpg signing, even with pinentry-tty
export GPG_TTY=$TTY

# For proper Rust setup
source ~/.cargo/env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
