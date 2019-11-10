#!/usr/bin/fish

set user (whoami)
set host (hostname)
set path (dirname (status --current-filename))
set branch $argv[1]
set revision $argv[2]

echo ----------
echo User: $user
echo Host: $host
echo Path: $path
echo Branch: $branch
echo Revision: $revision
echo ----------
echo cd $path
cd $path
and echo ----------
and echo rm -rf builds/$branch/$revision
and rm -rf builds/$branch/$revision
and echo ----------
and echo mkdir -p builds/$branch/$revision
and mkdir -p builds/$branch/$revision
and echo ----------
and echo git --git-dir=repo fetch
and git --git-dir=repo fetch
and echo ----------
and echo git --git-dir=repo --work-tree=builds/$branch/$revision checkout $revision -f
and git --git-dir=repo --work-tree=builds/$branch/$revision checkout $revision -f
and echo ----------

# cp .rbenv-vars builds/$branch/$revision

and echo ----------
and echo cd builds/$branch/$revision
and cd builds/$branch/$revision
and echo ----------
and echo "GIT_BRANCH=$branch >> .rbenv-vars"
and echo "GIT_BRANCH=$branch" >> .rbenv-vars
and echo "----------"
and echo "GIT_REVISION=$revision >> .rbenv-vars"
and echo "GIT_REVISION=$revision" >> .rbenv-vars
