if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

function parse_git_branch {
  [ -d .git ] || return 1
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="*"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "[${branch}${state}${remote}]"
  fi
}
export PS1='\w$(parse_git_branch) \$ '

git_completion='/usr/local/git/contrib/completion/git-completion.bash'
 
if [ -f $git_completion ]; then
  source $git_completion
fi

if [[ -s /Users/gk/.rvm/scripts/rvm ]] ; then source /Users/gk/.rvm/scripts/rvm ; fi

