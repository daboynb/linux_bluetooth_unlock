A script that monitors whether a Bluetooth device is connected or not. If the device is connected, all is okay; otherwise, the screen gets locked immediately until the device reconnects.

Tested only on Debian 12 gnome.


    wget https://raw.githubusercontent.com/daboynb/linux_bluetooth_unlock/main/Btmanager.sh && chmod +x Btmanager.sh && ./Btmanager.sh

# Images

# Before

- The program started with the Bluetooth device connected.

   
![before](https://github.com/daboynb/linux_bluetooth_unlock/assets/106079917/9c0992bc-2686-422c-a270-07204468a94c)

# After

- The program detected that the Bluetooth device got disconnected and locked the session.
- The program detected that the Bluetooth device got reconnected and unlocked the session.

   
![after](https://github.com/daboynb/linux_bluetooth_unlock/assets/106079917/1568bbd5-1e1e-4018-8126-104c38d105ef)
