# add a function path
fpath=(ZSH/functions ZSH/completions $fpath)

# Load all stock functions
autoload -U compaudit compinit

# Load all of the config files
for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done

#################### Zplug ####################
source ~/.zplug/init.zsh

# oh-my-zsh plugins
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Geomettry theme
zplug "geometry-zsh/geometry"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
