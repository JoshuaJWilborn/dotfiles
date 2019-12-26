if [ $# -ne 3 ]; then
  echo 'Must be called as `fix_email.sh "<old_email>" "<new_email>" "<full name>"`'
  exit 1
fi

export FILTER_BRANCH_SQUELCH_WARNING=1

export OLD_EMAIL=$1
export CORRECT_EMAIL=$2
export CORRECT_NAME=$3

git filter-branch --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
