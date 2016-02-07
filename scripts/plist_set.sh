#!/bin/sh

#Set from project root directory
info_plist="nh-showcase-dev/Info.plist"

error_handler(){
    title=$1
    info=$2
    echo "ERROR $title: $info"
    exit 1
}

if [ -f $info_plist ];
then
    #No quotes for facebook_id, numeric
    facebook_id_file=~/00/workspace/utils/ios/nh-showcase-dev/FacebookAppID.txt
    cf_bundle_url_schemes_file=~/00/workspace/utils/ios/nh-showcase-dev/CFBundleURLSchemes.txt
    facebook_display_name_file=~/00/workspace/utils/ios/nh-showcase-dev/FacebookDisplayName.txt

    #Try to get data from files
    if [ -f $facebook_id_file ];
    then
        facebook_id=$(<$facebook_id_file)
    else
        error_handler "File not found" "Can't find: $facebook_id_file"
    fi

    if [ -f $cf_bundle_url_schemes_file ];
    then
        cf_bundle_url_schemes=$(<$cf_bundle_url_schemes_file)
    else
        error_handler "File not found" "Can't find: $cf_bundle_url_schemes_file"
    fi

    if [ -f $facebook_display_name_file ];
    then
        facebook_display_name=$(<$facebook_display_name_file)
    else
        error_handler "File not found" "Can't find: $facebook_display_name_file"
    fi

    #Try to set data in file
    if [ -n ${facebook_id} ]; then
        /usr/libexec/PlistBuddy -c "Set :FacebookAppID ${facebook_id}" ${info_plist}
    else
        error_handler "Data not setable" "facebook_id: $facebook_id"
    fi

    if [ -n ${cf_bundle_url_schemes} ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleURLTypes:0:CFBundleURLSchemes:0 ${cf_bundle_url_schemes}" ${info_plist}
    else
        error_handler "Data not setable" "cf_bundle_url_schemes: $cf_bundle_url_schemes"
    fi

    if [ -n "${facebook_display_name}" ]; then
        /usr/libexec/PlistBuddy -c "Set :FacebookDisplayName ${facebook_display_name}" ${info_plist}
    else
        error_handler "Data not setable" "facebook_display_name: $facebook_display_name"
    fi
else
    error_handler "File not found" "$info_plist"
fi

