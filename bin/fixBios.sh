# apt install smbios-utils

# smbios-token-ctl | grep -i camera
Token: 0x0285 - Camera (Enable)
Desc: To enable Camera
Token: 0x0286 - Camera (Disable)

# smbios-token-ctl -i 0x0285
================================================================================
Token: 0x0285 - Camera (Enable)
value: bool = true
Desc: To enable Camera

# smbios-token-ctl -i 0x0286 --activate
Original Value
token: 0x0286
type: bool
value: false
Activating token...
New value
type: bool
value: true

# smbios-token-ctl -i 0x0285
================================================================================
Token: 0x0285 - Camera (Enable)
value: bool = false
Desc: To enable Camera
Desc: To disable Camera
