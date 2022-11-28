alias log="tail -f storage/logs/laravel.log"
alias master="git checkout master && git fetch --prune && git pull" # prune will update vscode source control
alias dev="git checkout dev && git fetch --prune && git pull"
alias git_clean="git branch --merged | grep -E -v \"(master|dev)\" | xargs git branch -d" #removes all merged branches from local
alias pa="php artisan"

function merge() { git merge "$@" --no-commit --no-ff; }

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"