#!/bin/bash
# this is broken in so many ways... DO NOT USE
echo 0 > /tmp/x
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --commit-filter '
git commit-tree "$@" > /tmp/rev
git reset --soft `cat /tmp/rev`
x=`cat /tmp/x`
echo $(($x+1)) > /tmp/x
/home/$USER/.cargo/bin/lucky_commit `printf %07d $(($x+1))`
git rev-list -1 HEAD
git reset --soft ORIG_HEAD
'

