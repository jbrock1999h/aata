# Build pretext project
pretext build
pretext generate

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata
# git remote add origin **How do you tell the url of the personal, forked branch when anyone could create one?

# git pull origin main
# git reset --hard origin/main