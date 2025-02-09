#!/bin/bash

# Array of possible User-Agent strings
user_agents=(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36"
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36"
  "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1"
  "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36"
)

# Infinite loop
while true; do
  # Generate random data for fields
  random_name=$(head /dev/urandom | tr -dc A-Za-z | head -c 8)
  random_phone=$(head /dev/urandom | tr -dc 0-9 | head -c 10)
  random_otp=$(head /dev/urandom | tr -dc 0-9 | head -c 6)
  random_password=$(head /dev/urandom | base64 | head -c 12)

  # Select a random User-Agent
  random_user_agent="${user_agents[$RANDOM % ${#user_agents[@]}]}"

  # First request
  curl 'https://sky.24jam.cloud/Bansos/Tf/firstData.php' -X POST \
    -H "User-Agent: $random_user_agent" \
    -H 'Accept: */*' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'Origin: https://sky.24jam.cloud' \
    -H 'Referer: https://sky.24jam.cloud/Bansos/Tf/' \
    --data-raw "full_name=$random_name&phone_number=$random_phone"

  # Second request
  curl 'https://sky.24jam.cloud/Bansos/Tf/secondData.php' -X POST \
    -H "User-Agent: $random_user_agent" \
    -H 'Accept: */*' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'Origin: https://sky.24jam.cloud' \
    -H 'Referer: https://sky.24jam.cloud/Bansos/Tf/' \
    --data-raw "full_name=$random_name&phone_number=$random_phone&otp_code=$random_otp"

  # Third request
  curl 'https://sky.24jam.cloud/Bansos/Tf/thirdData.php' -X POST \
    -H "User-Agent: $random_user_agent" \
    -H 'Accept: */*' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'Origin: https://sky.24jam.cloud' \
    -H 'Referer: https://sky.24jam.cloud/Bansos/Tf/' \
  --data-raw "full_name=$random_name&phone_number=$random_phone&otp_code=$random_otp&password=$random_password"
done
