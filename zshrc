# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Antigen
source ~/antigen.zsh

# Load Antigen configuration
antigen init ~/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias playground='cd ~/workspace/playground'

# opam configuration
test -r /home/ryano/.opam/opam-init/init.zsh && . /home/ryano/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

path+=('/home/ryano/bin')
path+=('/home/ryano/.local/bin')
path+=('/opt/node/bin')
path+=('/opt/gcc-arm/bin')
path+=('/opt/swift/usr/bin')
path+=('/opt/images')
export PATH
