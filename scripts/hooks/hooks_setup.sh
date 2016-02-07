#!/bin/sh
#Expects to be in project root/scripts/hooks
#Probably doesn't handle spaces directory names
#TODO: Add error handling and spaces

project_root=$(git rev-parse --show-toplevel)

cp pre-commit.sh $project_root/.git/hooks/pre-commit


