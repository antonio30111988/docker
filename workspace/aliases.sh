#! /bin/bash

# Colors used for status updates
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
#alias l="ls -lF ${colorflag}"
### MEGA: I want l and la ti return hisdden files
alias l="ls -laF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Commonly Used Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias home="cd ~"

alias h="history"
alias j="jobs"
alias e='exit'
alias c="clear"
alias cla="clear && ls -l"
alias cll="clear && ls -la"
alias cls="clear && ls"
alias code="cd /var/www"
alias ea="vi ~/aliases.sh"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias art="php artisan"
alias artisan="php artisan"
alias cdump="composer dump-autoload -o"
alias composer:dump="composer dump-autoload -o"
alias db:reset="php artisan migrate:reset && php artisan migrate --seed"
alias dusk="php artisan dusk"
alias fresh="php artisan migrate:fresh"
alias migrate="php artisan migrate"
alias refresh="php artisan migrate:refresh"
alias rollback="php artisan migrate:rollback"
alias seed="php artisan db:seed"
alias serve="php artisan serve --quiet &"

#Magento 2 Aliases
alias m2="cd /var/www/html/WeermanMagento2new"
alias api="cd /var/www/html/WeermanCentralApi"
alias shop="cd /var/www/html/WeermanShop"
alias admin="cd /var/www/html/WeermanAdmin"
alias debtor="cd /var/www/html/WeermanDebtorApi"
alias elk="cd /var/www/html/WeermanDockerELK"
alias rabbit="cd /var/www/html/WeermanDockerRabbitmqWorker"

#############################
#   WEERMAN COMMANDS
#############################

#Customer (CU)
alias m2csvcug="php bin/magento customers:csv:generate"
alias m2csvcuag="php bin/magento customers:address:csv:generate"
alias m2csvcugrg="php bin/magento customer:groups:csv:generate"
alias m2csvcumg="php bin/magento customers:main:csv:generate"
alias m2csvcui="php bin/magento customers:csv:import"
alias m2csvcuai="php bin/magento customers:address:csv:import"
alias m2csvcugri="php bin/magento customer:groups:csv:import"
alias m2csvcumi="php bin/magento customers:main:csv:import"

#Category (C)
alias m2csvcti="php bin/magento import:categories:tree "
alias m2csvcnameg="php bin/magento categories:names:csv:generate"
alias m2csvcnamei="php bin/magento categories:byNames:csv:import"
alias m2csvcparentg="php bin/magento categories:parent:csv:generate"
alias m2csvcparenti="php bin/magento categories:byParent:csv:import"
alias m2csvcpathg="php bin/magento categories:path:csv:generate"
alias m2csvcpathi="php bin/magento categories:byPath:csv:import"

#Pricing
alias m2csvapg="php bin/magento pricing:csv:generate   "
alias m2csvapi="php bin/magento pricing:csv:import"

#Product
alias m2csvpg="php bin/magento products:csv:generate"
alias m2csvpi="php bin/magento products:csv:import"
alias m2csvpis="php bin/magento import:simple:products"

#Whitelabel template
alias m2csvwtg="php bin/magento whitelabel:templates:csv:generate"
alias m2csvwti="php bin/magento whitelabel:templates:csv:import "

# Whitelabel
alias m2csvwg="php bin/magento whitelabels:csv:generate"
alias m2csvwi="php bin/magento admin:users:templates:csv:import"

# Weerman overall
alias m2attachment="php bin/magento weerman:test:attachment"

#################################
# WEERMAN END COMMANDS
#################################

#Store weboiste lsiting
alias m2stores="php bin/magento store:list"
alias m2websites="php bin/magento store:website:list"

#MAGENTO OTHER COMMANDS
alias m2ccache="php bin/magento cache:clean && php bin/magento cache:flush"
alias m2grunt="grunt clean:typeqast && grunt exec:typeqast && grunt less:typeqast"
alias m2cgen="rm -rf var/cache/* var/page:cache/* var/generated/*"
alias m2cc="php bin/magento cache:clean"
alias m2su="php bin/magento setup:upgrade"
alias m2cf="php bin/magento cache:flush"
alias m2ir="php bin/magento indexer:reindex"
alias m2sdc="php bin/magento setup:di:compile"
alias m2list="php bin/magento list"
alias m2qe="php bin/magento dev:query-log:enable"
alias m2qd="php bin/magento dev:query-log:disable"
alias m2the="php bin/magento dev:template-hints:enable"
alias m2thd="php bin/magento dev:template-hints:disable"
alias m2sscd="php bin/magento setup:static-content:deploy"
alias m2sscdf="php bin/magento setup:static-content:deploy -f"
alias m2ds="php bin/magento dump-server:start"
alias m2dms="php bin/magento deploy:mode:show"
alias m2dmst="php bin/magento deploy:mode:set"
alias m2rf="redis-cli FLUSHALL"
alias m2dep="php bin/magento dev:source-theme:deploy"
alias m2me="php bin/magento module:enable"
alias m2md="php bin/magento module:disable"
alias m2mi="php bin/magento module:install"
alias m2mu="php bin/magento module:uninstall"
alias m2gc="grunt clean"
alias m2ge="grunt exec"
alias m2gl="grunt less"
alias m2gw="grunt watch"

alias phpunit="./vendor/bin/phpunit"
alias pu="phpunit"
alias puf="phpunit --filter"
alias pud='phpunit --debug'

alias cc='codecept'
alias ccb='codecept build'
alias ccr='codecept run'
alias ccu='codecept run unit'
alias ccf='codecept run functional'

alias g="gulp"
alias npm-global="npm list -g --depth 0"
alias ra="reload"
alias reload="source ~/.aliases && echo \"$COL_GREEN ==> Aliases Reloaded... $COL_RESET \n \""
alias run="npm run"
alias tree="xtree"

# Xvfb
alias xvfb="Xvfb -ac :0 -screen 0 1024x768x16 &"

# requires installation of 'https://www.npmjs.com/package/npms-cli'
alias npms="npms search"
# requires installation of 'https://www.npmjs.com/package/package-menu-cli'
alias pm="package-menu"
# requires installation of 'https://www.npmjs.com/package/pkg-version-cli'
alias pv="package-version"
# requires installation of 'https://github.com/sindresorhus/latest-version-cli'
alias lv="latest-version"

# git aliases
alias gaa="git add ."
alias gd="git --no-pager diff"
alias git-revert="git reset --hard && git clean -df"
alias gs="git status"
alias whoops="git reset --hard && git clean -df"

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

function md() {
    mkdir -p "$@" && cd "$@"
}

function xtree {
    find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}
