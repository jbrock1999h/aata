#!/usr/bin/env bash

# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata

rm my_token.txt

#sleep 3

echo $GITHUB_TOKEN >> my_token.txt
#echo "my_token.txt created with no issues"

#unset GITHUB_TOKEN
#echo "GITHUB_TOKEN unset... Testing:"
#echo $GITHUB_TOKEN

#gh auth logout

#gh auth status
#echo "auth login number 1 ^ (after auth logout)"

#sleep 3

#gh auth login --with-token < my_token.txt
#echo "Logging in user passed with no issues"

# Requires user to answer yes, copy a code, then enter the code on a new tab that opens. None of this is possible throught the postStartCommand.sh script.
#gh auth refresh

#gh auth status
#echo "auth login number 1 ^ (after refresh)"

#gh repo fork $GITHUB_SERVER_URL/$GITHUB_REPOSITORY
#echo "Fork created with no issues"

git remote add origin $GITHUB_SERVER_URL/$GITHUB_USER/aata

git fetch origin

# The codespace tends to start under the main branch by default, and if the remotes aren't set up correctly you cannot change it to master. This is the line of code that would allow you to automatically set the branch to master if you have origin set:
git checkout --track origin/master

# This will start the web server that will allow you to view the textbook after editing it. Usually, you would need to run "pretext build" after altering the textbook, but the --watch tag allows pretext to automatically build when the source has been changed. So the user does not need to know the pretext commands to be able to edit and view their book.
sh view_web.sh &
# The command pretext view web starts a local server which creates a process that does not end until the user manually ends it. This means that any command that comes after pretext view web will not run unless the local server is manually closed.
#pretext view web &

# Running pretext view web from the postStartCommand.sh file does not cause the textbook to automatically open, so we were experimenting on ways to open the port through the command line. This did not work, and we think it is because we were trying to do this from within a container using a Command Line Interface. Instead, we are going to describe the process to connect manually in a tutorial.
#xdg-open http://localhost:8000-.preview.app.github.dev