#!/bin/bash

# Initializes a new Rust project by calling cargo new and inserting a bunch
# of useful files.
#
# Usage:
# new-rust-project.sh  <Project Name> [--bin]
#

set -o errexit

# Make sure there is at least the project name given
if [ $# -eq 0 ] ; then
    echo "No project name given! Usage:"
    echo " new-rust-project.sh <Project Name> [--bin]"
    echo ""
    exit 1
fi


# Call cargo
if [[ -n "$2" ]] && [[ "$2" == "--bin" ]] ; then
    cargo new --bin $1
else
    cargo new $1
fi


# Copy all the template files
MY_PATH="`dirname \"$0\"`"

cp $MY_PATH/.gitignore $1/
cp $MY_PATH/LICENSE-APACHE $1/
cp $MY_PATH/LICENSE-MIT $1/
cp $MY_PATH/README.md $1/
cp $MY_PATH/.travis.yml $1/

cp -r $MY_PATH/ci/ $1/


# Nice reminder
echo "Created new project from template!"
echo "=================================="
echo ""
echo "Please don't forget to:"
echo " - add the project's name in LICENSE-MIT"
echo " - fix the project's name in README.md"
if [[ "$2" == "--bin" ]] ; then
    echo " - Remove 'Cargo.lock' from the .gitignore "
fi
echo " - add some useful information to README.md"
echo " - enable this project on Travis-CI"
echo ""
