# This contains the information that is specific to your bash shells. It is read
# when you log in and also each time you open a new bash shell. This is the
# best location to add aliases so that your shell picks them up.

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Carica le mie personalizzazioni.
if [ -f ~/.bash_aldo_customizations ]; then
    . ~/.bash_aldo_customizations
fi

# Carica i comandi per l'autocompletamento di Hugo.
if [ -f ~/.bash_hugo_completion ]; then
    . ~/.bash_hugo_completion
fi

# GnuPG agent PRECEDENTE
#export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpg-connect-agent updatestartuptty /bye > /dev/null

# GnuPG agent ATTUALE
# https://wiki.archlinux.org/title/GnuPG#SSH_agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
