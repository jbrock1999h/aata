#!/usr/bin/env bash

# Ideally, we would want the textbook to be built during the prebuild process, so that it could be built in the background. This would make it so that the user does not need to wait the ~5 minutes that this process takes if the book is not already built in their container.
# Unfortunately, we found that when these lines (pretext new - pretext generate) were placed in the docker-build.sh file, they would not work correctly because the src files that they rely on to build do not exist at that point.
# Therefore, these commands need to be put sometime after the contents of the textbook appear in the container, which (as far as we know) happens at the earliest during the postCreateCommand file.

# Create a new PreTeXt project or update an existing one
echo "pretext new:"
pretext new -d .

#echo "pretext init:"
#pretext init --refresh

echo "Working Directory:"
pwd
echo "\n ls: \n"
ls
echo "\n"

if [ ! -d "/workspaces/aata/output" ]; then

    # Build pretext project
    echo "pretext build:"
    pretext build
    echo "pretext generate:"
    pretext generate
    
else
    echo "/workspaces/aata/output already exists. Not running build/generate"
fi



# For the Digital System Design book...
#echo "Installing Digital System Design textbook..."
#apt install iverilog
#git clone https://github.com/bjones1/digital_systems_design.git
#cd digital_systems_design
# A Runestone build must be run before waf configure will work, even though the waf build Runestone runs will fail.
#runestone build
#python3 waf configure --no-arm --no-pic24
