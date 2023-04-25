# Add new remote repositories for origin (forked) and upstream (original)
#git remote add upstream https://github.com/twjudson/aata
#git remote add origin https://github.com/jbrock1999h/aata

# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Build pretext project
pretext build
pretext generate
pretext view web