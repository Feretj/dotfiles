module_path+=( "/Users/feretj/.zplugin/bin/zmodules/Src" )
zmodload zdharma/zplugin

DEFAULT_USER="feretj"

ZSH_CACHE_DIR="/Users/feretj/.cache/zsh"

eval `gdircolors .dircolors`

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=10

unsetopt list_beep

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M KB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

### Added by Zplugin's installer
source '/Users/feretj/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice svn multisrc"{theme-and-appearance,clipboard,completion,directories,history,key-bindings,grep}.zsh" pick"";
zplugin snippet OMZ::lib
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/git-flow/git-flow.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/extract/extract.plugin.zsh
zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh
zplugin snippet OMZ::plugins/aws/aws.plugin.zsh
zplugin ice as"completion"
zplugin light zsh-users/zsh-completions
zplugin light djui/alias-tips
zplugin light chrissicool/zsh-256color

autoload -Uz compinit 
compinit

zplugin light bhilburn/powerlevel9k
zplugin ice silent wait'0'
zplugin light zdharma/history-search-multi-word
zplugin ice silent wait'0'
zplugin light zdharma/fast-syntax-highlighting

# Use same colors as ls
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group results by category
zstyle ':completion:*' group-name ''

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# Always use menu selection for `cd -`
zstyle ':completion:*:*:cd:*:directory-stack' force-list always
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# Pretty messages during pagination
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Nicer format for completion messages
zstyle ':completion:*' format '%B--- %d ---%b'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'
zstyle ':completion:*:warnings' format '%F{202}%BSorry, no matches for: %F{214}%d%b'

zstyle ':completion:*' verbose yes

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                            /usr/local/bin  \
                                            /usr/sbin       \
                                            /usr/bin        \
                                            /sbin           \
                                            /bin            \
                                            /usr/X11R6/bin

