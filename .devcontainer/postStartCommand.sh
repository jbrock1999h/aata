# Add new remote repositories for origin (forked) and upstream (original)
#git remote add upstream https://github.com/twjudson/aata
#git remote add origin https://github.com/jbrock1999h/aata

# The codespace tends to start under the main branch by default, and if the remotes aren't set up correctly you cannot change it to master. This is the line of code that would allow you to automatically set the branch to master if you have origin set (if you know the URL for the user's repo):
#git checkout --track origin/master

# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Build pretext project
pretext build
pretext generate

# This will start the web server that will allow you to view the textbook after editing it. Usually, you would need to run "pretext build" after altering the textbook, but the --watch tag allows pretext to automatically build when the source has been changed. So the user does not need to know the pretext commands to be able to edit and view their book.
pretext view web --watch &
# The command pretext view web starts a local server which creates a process that does not end until the user manually ends it. This means that any command that comes after pretext view web will not run unless the local server is manually closed.
xdg-open http://localhost:8000-.preview.app.github.dev