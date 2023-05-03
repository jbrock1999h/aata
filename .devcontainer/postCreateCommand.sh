#!/usr/bin/env bash

# Add new remote repositories for origin (forked) and upstream (original)
git remote add upstream https://github.com/twjudson/aata
echo $GITHUB_TOKEN >> my_token.txt
gh auth login --with-token < my_token.txt
gh repo fork $GITHUB_SERVER_URL/$GITHUB_REPOSITORY
git remote add origin $GITHUB_SERVER_URL/$GITHUB_REPOSITORY

# The codespace tends to start under the main branch by default, and if the remotes aren't set up correctly you cannot change it to master. This is the line of code that would allow you to automatically set the branch to master if you have origin set:
git checkout --track origin/master

# For the Digital System Design book...
#echo "Installing Digital System Design textbook..."
#apt install iverilog
#git clone https://github.com/bjones1/digital_systems_design.git
#cd digital_systems_design
# A Runestone build must be run before waf configure will work, even though the waf build Runestone runs will fail.
#runestone build
#python3 waf configure --no-arm --no-pic24
