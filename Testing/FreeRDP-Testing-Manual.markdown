% FreeRDP Testing Manual
% Marc-André Moreau
% Awake Coding Consulting Inc.

# Introduction

## References

[FreeRDP User Manual](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/User/FreeRDP-User-Manual.pdf?raw=true "FreeRDP User Manual")

[FreeRDP Developer Manual](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/Developer/FreeRDP-Developer-Manual.pdf?raw=true "FreeRDP Developer Manual")

[FreeRDP Configuration Manual](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/Configuration/FreeRDP-Configuration-Manual.pdf?raw=true "FreeRDP Configuration Manual")

# Serial Redirection


Connect an usb2serial converter (no need to connect a device)

Run xfreerdp /serial:COM10,/dev/ttyUSB0 /u:demo1 /p:qw /v:servername

Inside the rdp session open a cmd and verify that the port got mapped to COM10 using the change port /query command. This should give the following (or similar) output:

    change port /query
    AUX = \DosDevices\COM1
    COM1 = \Device\Serial0
    COM2 = \Device\Serial1
    COM10 = \Devices\RdpDrPort\;COM10:2\tsclient\COM10

Install [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)

Install [HyperTerminal](http://www.hilgraeve.com/support/htpe7.exe) (30-day trial)

Open Putty, select (*) serial, enter COM10 in the serial line edit and click the Open button:
xfreerdp's CPU usage will immediately raise (25% on my Linux-iMac) to a constant high level until you close putty

Open HyperTerminal, select Menu->File->New Connection, name it COM-10, select COM10 from the "connect using:" dropdown, click ok and again on ok in the next dialog.
xfreerdp's CPU usage will immediately increase but less compared to Putty (5% on my box)

Additional Information

Putty and HyperTerminal both use [SetCommTimeouts](http://msdn.microsoft.com/en-us/library/windows/desktop/aa363437).
Putty uses 1ms for ReadIntervalTimeout and Hyperterm 10ms.

Using mstsc I see literally no CPU usage.
