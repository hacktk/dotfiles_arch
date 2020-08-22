source /usr/share/git/completion/git-prompt.sh
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[01;37m\]$(__git_ps1 "(%s)")\[\033[01;34m\] \$\[\033[00m\] '

alias ll='ls -ahl'

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
