#!/bin/sh

scripts_dir=$(git rev-parse --show-toplevel)/scripts

#Run plist clean up script to remove confidential info

plist_clean_script=$scripts_dir/plist_clean.sh

$plist_clean_script
