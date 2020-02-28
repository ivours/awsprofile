#!/bin/bash

function list_aws_profiles() {
  COUNT=0
  echo "$AWS_PROFILES" | while read -r line ; do
    ((COUNT++))
    echo "${COUNT})$line"
  done
}

function set_aws_profile() {
  export AWS_PROFILE=$1
  printf "\nThe AWS profile ${AWS_PROFILE} has been set.\n\n"
}

function clear_aws_profile() {
  unset AWS_PROFILE
  printf "\nThe AWS profile has been cleared.\n\n"
}

AWS_PROFILES=$(cat ~/.aws/credentials | grep '\[*\]' | cut -d "[" -f2 | cut -d "]" -f1)

printf "\nChoose your AWS profile:\n\n"
printf "0)Clear current profile\n"

list_aws_profiles

printf "\nSelect profile number and press [ENTER]: "

read n

case $n in
  [1-9]*) SELECTED_AWS_PROFILE=$(echo "$AWS_PROFILES" | awk "NR==$n{print}")
	        set_aws_profile $SELECTED_AWS_PROFILE
  ;;
  0)
          clear_aws_profile
  ;;
esac
