#!/usr/bin/env bash

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata
echo "Remote upstream add passed with no issues"

echo $GITHUB_TOKEN >> my_token.txt
echo "my_token.txt created with no issues"

unset GITHUB_TOKEN
echo "github token variable unset with no issues"

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

# For the Digital System Design book...
#echo "Installing Digital System Design textbook..."
#apt install iverilog
#git clone https://github.com/bjones1/digital_systems_design.git
#cd digital_systems_design
# A Runestone build must be run before waf configure will work, even though the waf build Runestone runs will fail.
#runestone build
#python3 waf configure --no-arm --no-pic24
