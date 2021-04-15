# connect to previously paired device
systemctl restart bluetooth
bluetoothctl power on
bluetoothctl connect 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT


systemctl status bluetooth
#sudo
systemctl restart bluetooth

bluetoothctl power on
bluetoothctl discoverable on
bluetoothctl pairable on
bluetoothctl scan on
#bluetoothctl pair 04:FE:A1:00:61:D0
#bluetoothctl trust 04:FE:A1:00:61:D0
pavucontrol
pulseaudio -k

# redo 
bluetoothctl untrust 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
bluetoothctl remove 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
bluetoothctl pair 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
bluetoothctl connect 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
#
bluetoothctl untrust 00:18:91:78:61:0E # EDIFIER W855BT
bluetoothctl remove 00:18:91:78:61:0E # EDIFIER W855BT
bluetoothctl pair  00:18:91:78:61:0E # EDIFIER W855BT

bluetoothctl connect 00:18:91:78:61:0E # EDIFIER W855BT

bluetoothctl connect 3C:8D:20:66:AE:0C # bedroom speaker
bluetoothctl connect 5C:C6:E9:B6:F6:13 # EDIFIER R1700BT
bluetoothctl connect 00:18:91:78:61:0E # EDIFIER W855BT
bluetoothctl connect 00:1B:66:B7:C1:9B # Sennheiser CX 150BT



