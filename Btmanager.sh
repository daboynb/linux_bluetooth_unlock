#!/bin/bash

# Check if address already exist
if [ -f "/home/$USER/.bt.txt" ]; then
    echo "Bluetooth address already exists."
else
    echo "THE SCRIPT WILL WORK ONLY IF YOU HAVE ALREADY PAIRED YOUR PHONE OR SMARTWATCH TO THE PC"
    read -p "Press Enter to continue..."
    echo "Scanning for Bluetooth devices..."
    echo "Press Ctrl+C to stop when you see your device."
    bluetoothctl scan on

    # Ask for mac address
    while true; do
        read -p "Insert the MAC address (XX:XX:XX:XX:XX:XX format): " BLUETOOTH_DEVICE
        mac_regex="^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$"

        if [[ $BLUETOOTH_DEVICE =~ $mac_regex ]]; then
            echo "Valid MAC address: $BLUETOOTH_DEVICE"
            break
        else
            echo "Invalid MAC address format. Use only XX:XX:XX:XX:XX:XX format."
        fi
    done

    # Save into a txt the mac address
    echo "$BLUETOOTH_DEVICE" > "/home/$USER/.bt.txt"
fi

# Initialize the variable
previous_status=""

while true; do
    # Detect if Bt is connected
    device_info=$(bluetoothctl info "$BLUETOOTH_DEVICE")

    current_status=$(echo "$device_info" | grep "Connected:" | awk '{print $2}')

    if [ "$current_status" != "$previous_status" ]; then
        if [ "$current_status" = "yes" ]; then
            echo "Bluetooth device $BLUETOOTH_DEVICE is connected."
            loginctl unlock-session
        else
            echo "Bluetooth device $BLUETOOTH_DEVICE is not connected."
            loginctl lock-session
        fi
        previous_status="$current_status"  
    fi

    sleep 1
done
