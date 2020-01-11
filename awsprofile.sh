#!/bin/bash

AWS_PROFILES=$(cat ~/.aws/credentials | grep '\[*\]' | cut -d "[" -f2 | cut -d "]" -f1)

printf "\nChoose your AWS profile:\n\n"

COUNT=0

echo "$AWS_PROFILES" | while read -r line ; do
    ((COUNT++))
    echo "${COUNT})$line"
done

printf "\nSelect profile number and press [ENTER]: "

read n

case $n in
  [0-9]*) MY_AWS_PROFILE=$(echo "$AWS_PROFILES" | awk "NR==$n{print}");;
esac

export AWS_PROFILE=$MY_AWS_PROFILE

printf "\nThe AWS profile ${AWS_PROFILE} has been set.\n\n"
