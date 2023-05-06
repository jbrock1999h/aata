#!/usr/bin/env bash

# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata

#
#
# This script is used to authorize the user to run github commands through the CLI.
# Requires user to answer yes, copy a code, then enter the code on a new tab that opens. None of this is possible throught the postStartCommand.sh script.
#gh auth refresh

# This was going to be used to automate the forking of the repository, but it required the user to authorize the usage of github's CLI. As commented on above, this requires manual intervention from the user, and also must be run manually as none of the popups will popup if run from inside of a script.
#gh repo fork $GITHUB_SERVER_URL/$GITHUB_REPOSITORY

#
#

# This section of code is used to make sure that the user will be working in the master branch of the repository because codespace defaults to the main branch.
git remote add origin $GITHUB_SERVER_URL/$GITHUB_USER/aata

git fetch origin

# The codespace tends to start under the main branch by default, and if the remotes aren't set up correctly you cannot change it to master. This is the line of code that would allow you to automatically set the branch to master if you have origin set:
git checkout --track origin/master


# This will start the web server that will allow you to view the textbook after editing it. Usually, you would need to run "pretext build" after altering the textbook, but the --watch tag allows pretext to automatically build when the source has been changed. So the user does not need to know the pretext commands to be able to edit and view their book.
# In our testing, we found that the --watch tag caused this application to start multiple copies of itself, which causes it to kill itself within a minute. These copies take up too much memory as they stack on top of each other, so the system views it as a threat and kills it. Therefore, we decided to move back to the usual pretext view web instead.
#pretext view web --watch

# The command pretext view web starts a local server which creates a process that does not end until the user manually ends it. This means that any command that comes after pretext view web will not run unless the local server is manually closed. This can be stepped around by opening a new terminal window.
pretext view web

# Running pretext view web from the postStartCommand.sh file does not cause the textbook to automatically open, so we were experimenting on ways to open the port through the command line. This did not work, and we think it is because we were trying to do this from within a container using a Command Line Interface. Instead, we are going to describe the process to connect manually in a tutorial.
#xdg-open http://localhost:8000-.preview.app.github.dev