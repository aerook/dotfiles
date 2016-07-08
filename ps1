COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detatched at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

function last_shared_hash {
  echo "$(git merge-base --fork-point master)"
}

function changed_files {
echo "$(git log --name-only --pretty=oneline --full-index $(last_shared_hash)..HEAD | grep -vE '^[f0-9a-f]{40} ' | sort | uniq)"
}

function changed_spec_files {
  echo "$(changed_files | grep spec\.rb)"
}

function test_branch {
  echo "Testing:"
  echo "$(changed_spec_files)"
  echo "$(bundle exec rspec $(changed_spec_files | tr "\\n", " ") -f d)"
}

PS1="\[$COLOR_OCHRE\][\$(date +%k:%M:%S)]" # Timestamps
PS1+="\[$COLOR_WHITE\][\W]" # Current directory, in white: [~]
PS1+="\[\$(git_color)\]"  # Set git status color
PS1+="\$(git_branch)"     # Add current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "

export PS1
