# Add new remote repositories for origin (forked) and upstream (original)
#git remote add upstream https://github.com/twjudson/aata
#git remote add origin https://github.com/jbrock1999h/aata

# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Build pretext project
pretext build
pretext generate
pretext view web &
# The command pretext view web starts a local server which creates a process that does not end until the user manually ends it. This means that any command that comes after pretext view web will not run unless the local server is manually closed.
xdg-open http://localhost:8000