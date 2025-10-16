#!/bin/bash
#User inputs name
read -p "Enter the name: " Name
mkdir -p submission_reminder_$Name
Name=$(echo "$Name"| tr '[:upper:]' '[:lower:]')

# Validate that the name is not empty
if [[ -z "$Name" ]]; then
    echo "Name can't be empty. Please run the script again with a valid name."
    exit 1
fi

# Validate that the name contains only alphabetic characters
if [[ ! "$Name" =~ ^[a-zA-Z]+$ ]]; then
    echo "Invalid name.use alphabetic characters only."
    exit 1
fi


Dir="submission_reminder_$Name"
Submission_file="$Dir/assets/submissions.txt"
config_file="$Dir/config/config.env"

# Checking if the directory exists
if [[ ! -d "$Dir" ]]; then
    echo "Directory '$Dir' doesn't exist"
    exit 1
fi

#Prompting user for assignment name and days remaining
read -p "Enter assignment name: " Assignment
read -p "Enter days remaining to submit: " DaysRemaining

# Validating user inputs
if [[ -z "$Assignment" ]]; then
    echo "Assignment name and days remaining can't be empty. Provide valid inputs."
    exit 1
fi

if [[ -z "$DaysRemaining" ]]; then
    echo "Days can't be empty."
    exit 1
fi
DaysRemaining=$(echo "$DaysRemaining" | xargs)

if [[ ! $Assignment =~ ^[a-zA-Z\ ]+$ ]]; then
    echo "Invalid assignment name. Assignment should only have letters,number and spaces."
    exit 1
fi

if [[ !DaysRemaining =~ ^[0-9]+$ ]]; then
    echo "It should be a positive integer between 0 and 9."
    exit 1
fi

matching_assignment=$(grep -i ", *$Assignment," "$Submission_file" | awk -F, '{print $2}' | head -n1 | xargs)
if [[ -z "$matching_assignment" ]]; then
    echo "No matching assignment found in submissions.txt."
    exit 1
fi

cat <<EOF > $config_file
# Configuration file for submission reminder app
ASSIGNMENT="$Assignment"
DAYS_REMAINING=$DaysRemaining
EOF

read -p "Do you want to run the application? (y/n): " run_now

if [[ "$run_now" =~ ^[Yy]$ ]]; then
    echo "Running the application..."
    cd "$Dir" 
    ./startup.sh
else
    echo "You can run the application by executing $Dir/app/reminder.sh and execute ./startup.sh"
fi