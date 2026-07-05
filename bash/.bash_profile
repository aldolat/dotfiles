# This is used by each user to enter information that is specific to his or
# her use of the shell. It is executed only once—when the user logs in.
# By default, it sets a few environment variables and executes the user’s
# .bashrc file. This is a good place to add environment variables because,
# once set, they are inherited by future shells.

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Aggiunge ~/.local/bin alla variabile PATH
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Imposta la variabile d'ambiente per l'agente di SSH.
# https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user
# Nota: dopo aver dato questo comando
# systemctl enable --user ssh-agent.service
# ho poi impostato questa riga:
# export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Imposta la variabile di ambiente per la chiave SSH fornita da GnuPG.
# Mi serve per Vorta.
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Dice alle applicazioni GTK di usare le finestre di KDE per gestire i file
# export GTK_USE_PORTAL=1

# Additions for TeX Live
# Disattivati perché uso Tex Live dai repository
#export MANPATH=":/home/aldo/Apps/texlive/2022/texmf-dist/doc/man"
#export INFOPATH=":/home/aldo/Apps/texlive/2022/texmf-dist/doc/info"
#export PATH="$PATH:/home/aldo/Apps/texlive/2022/bin/x86_64-linux"
