#------------------------------------------------------------------#
# File:        .zprofile                                           #
# Description: ZSH profile file                                    #
# Version:     0.1.0                                               #
# Author:      Aldo Latino <aldolat@gmail.com>                     #
#------------------------------------------------------------------#

#-----------------------------
# Aggiunge ~/.local/bin alla variabile PATH
#-----------------------------
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

#-----------------------------
# GnuPG agent for SSH
# https://wiki.archlinux.org/title/GnuPG#SSH_agent
#-----------------------------
unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

#-----------------------------
# Default editor
#-----------------------------
export EDITOR=nano

#-----------------------------
# Percorsi di default (non erano definiti prima di averli aggiunti qui)
#-----------------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#-----------------------------
# Imposta *nouveau* come driver VDPAU
#-----------------------------
# export VDPAU_DRIVER=nouveau

#-----------------------------
# Imposta *nvidia* come driver VA-API e VDPAU
#-----------------------------
#export LIBVA_DRIVER_NAME=nvidia
#export VDPAU_DRIVER=nvidia

#-----------------------------
# Enable the Secret Service API integration
# https://wiki.archlinux.org/title/GnuPG#pinentry
#-----------------------------
export PINENTRY_KDE_USE_WALLET=1
