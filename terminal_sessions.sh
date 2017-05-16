#!/bin/bash

# usage: init kafka_brokers 

new_tab() {
        pwd=`pwd`
        osascript -e "tell application \"Terminal\"" \
        -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
        -e "set current settings of selected tab of window 1 to settings set \"$2\"" \
        -e "do script \"cd $pwd; clear; $1;\" in front window" \
        -e "end tell"
        > /dev/null
}

function init() {
    v_hosts=$1[@]
    hosts=("${!v_hosts}")
	
	# set the profiles
	case "$1" in
		"kafka_brokers") profile="Ocean";;
		"namenode") profile="Red Sands";;
		*) profile="Grass";;
	esac

	# call new_tab function
    for i in "${hosts[@]}" ; do
        new_tab "ssh $i" "$profile"
    done
}


# hosts for brokers
declare -a kafka_brokers=(
				"broker_host1" 
				"broker_host2" 
				"broker_host3" 
				"broker_host4"
				)
# host for name node
declare -a namenode=(
				"nn_host"
				)

