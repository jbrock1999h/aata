# Reset to origin main (This is for if the codespace has not caught up to changes made previously)
#git pull origin main
#git reset --hard origin/main

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata
echo "Remote upstream add passed with no issues"

rm my_token.txt

sleep 3

echo $GITHUB_TOKEN >> my_token.txt
echo "my_token.txt created with no issues"

unset GITHUB_TOKEN
echo "github token variable unset with no issues"

sleep 3

gh auth login --with-token < my_token.txt
echo "Logging in user passed with no issues"

gh repo fork $GITHUB_SERVER_URL/$GITHUB_REPOSITORY
echo "Fork created with no issues"

git remote add origin $GITHUB_SERVER_URL/$GITHUB_USER/aata
echo "Origin added with no issues"

git fetch origin
echo "Origin added with no issues"

# The codespace tends to start under the main branch by default, and if the remotes aren't set up correctly you cannot change it to master. This is the line of code that would allow you to automatically set the branch to master if you have origin set:
git checkout --track origin/master
echo "origin master checked out with no issues"

# This will start the web server that will allow you to view the textbook after editing it. Usually, you would need to run "pretext build" after altering the textbook, but the --watch tag allows pretext to automatically build when the source has been changed. So the user does not need to know the pretext commands to be able to edit and view their book.
#pretext view web --watch &
# The command pretext view web starts a local server which creates a process that does not end until the user manually ends it. This means that any command that comes after pretext view web will not run unless the local server is manually closed.
#pretext view web &

# Running pretext view web from the postStartCommand.sh file does not cause the textbook to automatically open, so we were experimenting on ways to open the port through the command line. It did not work out.
#xdg-open http://localhost:8000-.preview.app.github.dev