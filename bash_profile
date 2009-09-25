export CLICOLOR=1

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi
if [ -f ~/.rvm/current ] ; then source ~/.rvm/current ; fi
