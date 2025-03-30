#!/bin/bash

# Downloading the PINGPONG file from the given URL
echo "Downloading the PINGPONG file..."
wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG -O PINGPONG

# Granting execution permission to the PINGPONG file
echo "Granting execution permission to the PINGPONG file..."
chmod +x PINGPONG

# Looping to request a key from the user until a valid one is provided
while true; do
  # Prompting the user to enter a key
  echo -n "Enter your key: "
  read user_key

  # Checking if the key is empty
  if [ -z "$user_key" ]; then
    echo "The key cannot be empty. Please enter a valid key."
    continue  # Return to the start of the loop to request input again
  fi

  # Running the PINGPONG file with the provided key
  echo "Running PINGPONG with the provided key..."
  ./PINGPONG --key="$user_key"

  # Checking if PINGPONG executed successfully
  if [ $? -eq 0 ]; then
    # If PINGPONG runs successfully, exit the loop
    echo "Key is valid, proceeding to the next step."
    break
  else
    # If PINGPONG fails (incorrect key), display a warning and retry
    echo "Invalid key. Please enter the correct key."
  fi
done

# Displaying the completion message
echo "Script execution completed."
