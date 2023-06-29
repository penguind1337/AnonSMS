#!/bin/bash

chmod +x .install.sh
./.install.sh

clear

GREEN='\033[1;32m'
NC='\033[0m'

sleep 2

echo -e "${GREEN}"
figlet -c AnonSMS
echo -e "${NC}"

sleep 2

echo -e "${GREEN}Welcome to AnonSMS, where you can send anonymous messages!${NC}"
sleep 2
echo -e "${GREEN}You can send only 1 message per day.${NC}"

sleep 4

echo -ne "${GREEN}Enter phone number: ${NC}"
read -r phone
echo -ne "${GREEN}Enter message: ${NC}"
read -r message
key="textbelt"

response=$(curl -s -X POST https://textbelt.com/text \
--data-urlencode phone="$phone" \
--data-urlencode message="$message" \
-d key="$key")

sleep 5

if [[ $response == *"true"* ]]; then
    echo -e "${GREEN}Message sent successfully!${NC}"
else
    echo -e "${GREEN}Message failed to send.${NC}"
fi

sleep 5 
clear