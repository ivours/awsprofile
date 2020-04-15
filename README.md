# awsprofile
Simple tool to easily switch between aws profiles.

## Usage

Just source the bash script `. awsprofile.sh`. It will search for all your credentials in `~/.aws/credentials` file and list the options labeled by number. Select the corresponding number to the profile you want to use and then you'll be ready to execute aws cli commands with the selected profile.

```
Example:
------
. awsprofile.sh [option]

where [option]:
  --help
    Display this help
                
  clear
    Clear/unset and profiles
                
  profile
    Set the particular profile you wish if known
                
  'none'
    If no option is set, the list menu will appear with all the profile options
```
