# Git
alias master="git checkout master && git fetch --prune && git pull" # prune will update vscode source control
alias dev="git checkout dev && git fetch --prune && git pull"
alias git_clean="git branch --merged | grep -E -v \"(master|dev)\" | xargs git branch -d" #removes all merged branches from local

function merge() { git merge "$@" --no-commit --no-ff; }

# Laravel
alias pa="php artisan"
alias log="tail -f storage/logs/laravel.log"
alias node-fix="export NODE_OPTIONS=--openssl-legacy-provider" # Fixes Node v17+ issue with webpack

function seed() { if [ -z ${@} ];
		 then
		   echo "Running: php artisan seed";
                   php artisan db:seed; 
		 else
	           echo "Running: php artisan seed --class=""$@";
		   php artisan db:seed --class="$@"; 
		 fi
		 }

function migrate() { if [ -z ${@} ];
                 then
		  echo "Running: php artisan migrate";
                  php artisan migrate; 
                 else
		  echo "Running: php artisan migrate --path=database/migrations/""$@"".php";
                  php artisan migrate --path=database/migrations/"$@".php; 
                 fi
                 }

# General
alias www="cd ~/c && cd wamp64/www" # quickly navigate to webapp folder

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
