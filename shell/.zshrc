#------------------------------------------------------------------#
# File:        .zshrc                                              #
# Description: ZSH resource file                                   #
# Version:     0.1.0                                               #
# Author:      Aldo Latino <aldolat@gmail.com>                     #
#------------------------------------------------------------------#

#-----------------------------
# NOTE
#    1. Options for setopt can be found here:
#       https://zsh.sourceforge.io/Doc/Release/Options.html
#    2. zsh-syntax-highlighting must be loaded the last.
#-----------------------------

#-----------------------------
# History
#-----------------------------
HISTFILE=~/.zsh_histfile        # File in cui viene salvata la cronologia dei comandi.
HISTSIZE=5000                   # Numero massimo di comandi salvati in memoria.
SAVEHIST=$HISTSIZE              # Numero massimo di comandi salvati sul file.
HISTDUP=erase                   # Rimuove i duplicati successivi nella cronologia.
setopt appendhistory            # Aggiunge i nuovi comandi alla cronologia esistente.
setopt hist_ignore_space        # Non salva i comandi che iniziano con uno spazio.
setopt hist_ignore_all_dups     # Elimina tutti i duplicati dalla cronologia.
setopt hist_save_no_dups        # Non salva duplicati nel file della cronologia.
setopt hist_ignore_dups         # Non salva duplicati consecutivi nella sessione corrente.
setopt hist_find_no_dups        # Non mostra duplicati nei risultati di ricerca della cronologia.
setopt EXTENDED_HISTORY         # Salva timestamp e durata per ogni comando nella cronologia.

#-----------------------------
# Options
#-----------------------------
setopt autocd                   # Cambia directory digitandone solo il nome (senza `cd`).
setopt beep                     # Emette un suono per alcuni eventi (può essere fastidioso!).
setopt extended_glob            # Abilita funzionalità avanzate di globbing (ad es. `*(.)` per i file regolari).
setopt nomatch                  # Non genera errori se un pattern di globbing non trova corrispondenze.
setopt notify                   # Mostra notifiche di completamento per processi in background.
setopt prompt_subst             # Permette l'espansione di comandi nelle variabili di prompt.

#-----------------------------
# Load completions
#-----------------------------
# Aggiungi path per completamenti extra (se hai zsh-completions installato)
if [[ -d /usr/share/zsh/site-functions ]]; then
  fpath=(/usr/share/zsh/site-functions $fpath)
fi

zstyle :compinstall filename '/home/aldo/.zshrc'
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit

#-----------------------------
# Plugins
#-----------------------------

# 1. Git prompt - primo perché modifica il prompt
if [[ -f /usr/share/zsh/scripts/git-prompt.zsh ]]; then
  source /usr/share/zsh/scripts/git-prompt.zsh
fi

# 2. Command not found - utile averlo presto
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# 3. History substring search - prima degli autosuggestions
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# 4. Autosuggestions - prima del syntax highlighting
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  # Configurazione autosuggestions
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# 5. Hugo completion
if [[ -f ~/src/zsh-completions/zsh_hugo_completion ]]; then
  source ~/src/zsh-completions/zsh_hugo_completion
fi

# 6. wp-cli completion
#if [[ -f ~/src/zsh-completions/wp-completion.bash ]]; then
  # source ~/src/zsh-completions/wp-completion.bash
#fi

# 7. Syntax highlighting - SEMPRE PER ULTIMO
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# eval $(thefuck --alias)

#-----------------------------
# Keybindings
#-----------------------------
bindkey -e

# Set up fzf key bindings and fuzzy completions
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# Per i widget di Zsh vedi:
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# History search
bindkey '^[[5~' history-substring-search-up
bindkey '^[[6~' history-substring-search-down

# Moving between word in terminal
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Canc key to forward delete a char
bindkey '^[[3~' delete-char

# Ctrl+Canc to forward delete a word
bindkey '^[[3;5~' kill-word

# Ctrl+Backspace to backward delete a word
bindkey '^H' backward-kill-word

# Beginning of line
bindkey '^[[H' beginning-of-line

# End of line
bindkey '^[[F' end-of-line

#-----------------------------
# Prompt theme
#-----------------------------
# Aldo Classic
if [[ -f $HOME/.zsh_prompt_aldo_classic ]]; then
  source $HOME/.zsh_prompt_aldo_classic
fi
# Aldo Two Lines
# if [[ -f $HOME/.zsh_prompt_aldo_twolines ]]; then
#   source $HOME/.zsh_prompt_aldo_twolines
# fi

#eval "$(starship init zsh)"

#-----------------------------
# Aliases
#-----------------------------
if [[ -f $HOME/.zsh_aliases ]]; then
  source $HOME/.zsh_aliases
fi

#-----------------------------
# Configure pinentry to use the correct TTY
# https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY
#-----------------------------
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
