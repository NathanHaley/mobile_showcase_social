#!/bin/sh

#Update PLIST_FOLDER to the folder, path, from root of project containing project's plist
plist_folder=nh-showcase-dev

project_root=$(git rev-parse --show-toplevel)

info_plist="$project_root/$plist_folder/info.plist"

if [ -f $info_plist ];
then
    echo "Cleaning: $info_plist"
    /usr/libexec/PlistBuddy -c "Set :FacebookAppID XXXX" ${info_plist}
    /usr/libexec/PlistBuddy -c "Set :CFBundleURLTypes:0:CFBundleURLSchemes:0 XXXX" ${info_plist}
    /usr/libexec/PlistBuddy -c "Set :FacebookDisplayName XXXX" ${info_plist}
else
    echo "ERROR File not found: $info_plist"
    echo "Commit Cancelled"
    exit 1
fi


