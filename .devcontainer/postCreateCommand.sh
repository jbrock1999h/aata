#!/usr/bin/env bash
# Create a new PreTeXt project or update an existing one
echo "pretext new:"
pretext new -d .
#echo "pretext init:"
#pretext init --refresh
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
