% FreeRDP User Manual
% Marc-André Moreau
% Awake Coding Consulting Inc.

# Introduction

## Help

FreeRDP - A Free Remote Desktop Protocol Implementation

See www.freerdp.com for more information

	Usage: ./client/X11/xfreerdp [file] [options] [/v:<server>[:port]]

Syntax:

    /flag (enables flag)
    /option:<value> (specifies option with value)
    +toggle -toggle (enables or disables toggle, where '/' is a synonym of '+')

    /v:<server>[:port]   	Server hostname
    /port:<number>       	Server port
    /w:<width>           	Width
    /h:<height>          	Height
    /size:<width>x<height>	Screen size
    /f                   	Fullscreen mode
    /bpp:<depth>         	Session bpp (color depth)
    /kbd:0x<layout id> or <layout name>	Keyboard layout
    /kbd-list            	List keyboard layouts
    /kbd-type:<type id>  	Keyboard type
    /kbd-subtype:<subtype id>	Keyboard subtype
    /kbd-fn-key:<function key count>	Keyboard function key count
    /admin               	Admin (or console) session
    /multimon            	Multi-monitor
    /workarea            	Work area
    /t:<title>           	Window title
    +decorations (default:off)	Window decorations
    /a                   	Addin
    /vc                  	Static virtual channel
    /dvc                 	Dynamic virtual channel
    /u:[<domain>\\]<user> or <user>[@<domain>]	Username
    /p:<password>        	Password
    /d:<domain>          	Domain
    /g:<gateway>[:port]  	Gateway Hostname
    /gu:[<domain>\\]<user> or <user>[@<domain>]	Gateway username
    /gp:<password>       	Gateway password
    /gd:<domain>         	Gateway domain
    /app:||<alias> or <executable path>	Remote application program
    /app-name:<app name> 	Remote application name for user interface
    /app-icon:<icon path>	Remote application icon for user interface
    /app-cmd:<parameters>	Remote application command-line parameters
    /app-file:<file name>	File to open with remote application
    /app-guid:<app guid> 	Remote application GUID
    +compression (default:off)	Compression
    /shell               	Alternate shell
    /shell-dir           	Shell working directory
    /audio-mode          	Audio output mode
    /mic                 	Audio input (microphone)
    /network             	Network connection type
    +clipboard (default:off)	Redirect clipboard
    +fonts (default:off) 	Smooth fonts (cleartype)
    +aero (default:off)  	Desktop composition
    +window-drag (default:off)	Full window drag
    +menu-anims (default:off)	Menu animations
    -themes (default:on) 	Themes
    -wallpaper (default:on)	Wallpaper
    /gdi:<sw|hw>         	GDI rendering
    /rfx                 	RemoteFX
    /rfx-mode:<image|video>	RemoteFX mode
    /frame-ack:<number>  	Frame acknowledgement
    /nsc                 	NSCodec
    /jpeg                	JPEG codec
    /jpeg-quality:<percentage>	JPEG quality
    -nego (default:on)   	protocol security negotiation
    /sec:<rdp|tls|nla|ext>	force specific protocol security
    -sec-rdp (default:on)	rdp protocol security
    -sec-tls (default:on)	tls protocol security
    -sec-nla (default:on)	nla protocol security
    +sec-ext (default:off)	nla extended protocol security
    /cert-name:<name>    	certificate name
    /cert-ignore         	ignore certificate
    /pcb:<blob>          	Preconnection Blob
    /pcid:<id>           	Preconnection Id
    /vmconnect:<vmid>    	Hyper-V console (use port 2179, disable negotiation)
    -authentication (default:on)	authentication (hack!)
    -encryption (default:on)	encryption (hack!)
    -grab-keyboard (default:on)	grab keyboard
    -mouse-motion (default:on)	mouse-motion
    /parent-window:<window id>	Parent window id
    -bitmap-cache (default:on)	bitmap cache
    -offscreen-cache (default:on)	offscreen bitmap cache
    -glyph-cache (default:on)	glyph cache
    /codec-cache:<rfx|nsc|jpeg>	bitmap codec cache
    -fast-path (default:on)	fast-path input/output
    +async-input (default:off)	asynchronous input
    +async-update (default:off)	asynchronous update
    /version             	print version
    /help                	print help

Examples:

    xfreerdp connection.rdp /p:Pwd123! /f
    xfreerdp /u:CONTOSO\\JohnDoe /p:Pwd123! /v:rdp.contoso.com
    xfreerdp /u:JohnDoe /p:Pwd123! /w:1366 /h:768 /v:192.168.1.100:4489
    xfreerdp /u:JohnDoe /p:Pwd123! /vmconnect:C824F53E-95D2-46C6-9A18-23A5BB403532 /v:192.168.1.100

	Clipboard Redirection: +clipboard

	Drive Redirection: /a:drive,home,/home
	Smartcard Redirection: /a:smartcard,<device>
	Printer Redirection: /a:printer,<device>,<driver>
	Serial Port Redirection: /a:serial,<device>
	Parallel Port Redirection: /a:parallel,<device>
	Printer Redirection: /a:printer,<device>,<driver>

	Audio Input Redirection: /dvc:audin,sys:alsa
	Audio Output Redirection: /vc:rdpsnd,sys:alsa

	Multimedia Redirection: /dvc:tsmf,sys:alsa
	USB Device Redirection: /dvc:urbdrc,id,dev:054c:0268

## Command-Line Interface

As of FreeRDP 1.1, the command-line interface supports two syntaxes and a completely redesigned set of command-line options. Since this is a major change, backwards compatibility is still provided for the now deprecated old command-line interface.

FreeRDP uses the same command-line syntax and options as mstsc as a basis, allowing a consistent interface between RDP implementations. The mstsc help can be obtained by launching mstsc with the /? option:

![mstsc help](images/mstsc_help.png "mstsc help")

On top of this basic set of options, FreeRDP provides a large selection of extended options to fit all needs possible. The result is a compatible and consistent RDP implementation which is much more flexible and extensible than the original. This is why FreeRDP is used on Windows, where mstsc is already available for free.

## Syntax

FreeRDP supports two command-line syntaxes: the default windows-style syntax and the alternative posix-style syntax. This is made possible by a generic and highly reusable command-line parsing engine that is part of WinPR. On average, the windows-style syntax provides shorter command lines than the posix-style syntax. However, many users tend to prefer the posix-style syntax and may strongly dislike the windows-style syntax, which is why *both* syntaxes are supported. For the purpose of documenting FreeRDP, the windows-style syntax is preferred over the posix-style syntax.

There are three types of options possible:

    /flag (enables flag)
    /option:<value> (specifies option with value)
    +toggle -toggle (enables or disables toggle, where '/' is a synonym of '+')

If we observe the following command line:

	xfreerdp /f /bpp:32 /v:rdp.contoso.com +wallpaper -themes

/f is a flag which enables the fullscreen mode.
/bpp:32 is the "bpp" option that specifies the color depth with a value of 32.
/v:rdp.contoso.com is the "v" option for the target server with rdp.contoso.com as its value.
+wallpaper is an option that enables the wallpaper toggle option.
-themes is an option that disables the themes toggle option.

Enabling a toggle option can be done with both '+' and '/' for the sake of simplicity. This means that enabling the wallpaper can be done with "+wallpaper" or with "/wallpaper".

### Alternate Syntax

The alternate syntax produces longer command lines on average, but may be more accessible to users who prefer a posix-style syntax. If this is your case, here is how the alternative syntax works:

    --flag (enables flag)
    --option:<value> (specifies option with value)
    --enable-toggle --disable-toggle (enables or disables toggle)

Performing syntaxic substitutions on our example, the command line becomes:

	xfreerdp -f --bpp 32 -v rdp.contoso.com --enable-wallpaper --disable-themes

The same command in the windows-style syntax uses 57 characters, while the posix-style syntax uses 75 characters. In this specific case, the windows-style syntax is approximately 25% shorter than the posix-style syntax.

### Rationale

One may ask: why, oh why? Well, here's why:

The first easy answer is out-of-the-box compatibility with mstsc, but there's a lot more to it than just that.

One of the most annoying aspect of the posix-style syntax is that it uses the minus '-' sign to *enable* an option, preventing unambiguous usage of the same symbol to mean *disable*. Certain programs using a posix-style syntax do accept +/-, but you need to know which options can be toggled in such a manner beforehand. This can easily lead to confusion because one cannot know just by looking at the syntax if the minus '-' sign is used to enable or disable an option, as knowledge of the option type is required to make the distinction.

In order to unambiguously make use of the minus +/- as a way to toggle options, we need to use a symbol other than minus '-' to enable options. Since the windows-style syntax uses the slash '/' symbol instead, this problem is solved.

The toggle options are very frequently used in FreeRDP, which is why it makes sense to use a syntax that keeps them short and readable. When you type options like --disable-themes multiple times a day and your command lines contain *many* such options, it is hard to argue against using the +/- notation.

One other strong aspect of the windows-style syntax is the usage of the colon as an option/value separator instead of a space. While this may require some adaptation for some users, it reduces the potential for ambiguity in the case of values that are lists. Most of the time, windows-style syntaxes encode lists as comma-separated values:

	/list:item1,item2,item3

With regular posix-style syntax, the same list would be encoded this way:

	--list item1 item2 item3 --
	
In the case of FreeRDP, lists are encoded in the same way regardless of the syntax in use, even if this diverges slightly from standard practice:

	--list item1,item2,item3

The comma-separated list is used because it provides unambiguous encoding of a list: otherwise, there is no way of knowing where the list ends, which is which the regular posix-style syntax makes use of "--" as the end-of-list delimiter. The old set of FreeRDP options historically made use of this list encoding, and it definitely won't be missed by many users.

If even after reading this you can't get used to the windows-style syntax, simply make use of the posix-style syntax.

## Authentication

Sample Values:

* User: JohnDoe
* Domain: CONTOSO
* Password: Password123!
* Server: rdp.contoso.com

There simplest, unambiguous way of passing credentials at the command-line is with /u, /d and /p. The domain name is only needed if you connect using domain credentials:

	xfreerdp /u:JohnDoe /d:CONTOSO /p:Password123! /v:rdp.contoso.com

The domain name can also be passed in the username using the same notation accepted by mstsc:

	xfreerdp /u:CONTOSO\JohnDoe /p:Password123! /v:rdp.contoso.com
	
While the above notation is shorter, it has an unpractical side effect: the backslash is often, but not always, interpreted as an escape character. To avoid the problem, make sure the shell does not interpret the backslash as an escape character:

	xfreerdp /u:CONTOSO\\JohnDoe /p:Password123! /v:rdp.contoso.com
	xfreerdp "/u:CONTOSO\JohnDoe" /p:Password123! /v:rdp.contoso.com

From experience, most Linux shells will require such handling of the backslash character. However, there are certain cases like the Eclipse launcher which do not require it.

Alternatively, the User Principal Name (UPN) notation can be used:

	xfreerdp /u:JohnDoe@CONTOSO /p:Password123! /v:rdp.contoso.com

This notation does not have the drawbacks of the backslash character, but introduces a potential conflict with usernames containing the '@' symbol and no domain name. This is frequently the case with the new Windows 8 Microsoft Accounts (a.k.a. Windows Live Accounts) which correspond to an email address. To work work around the ambiguity, precede the user name "john.doe@live.com" with a backslash:

	xfreerdp /u:\john.doe@live.com /p:Password123! /v:rdp.contoso.com
	
Be careful to properly handle the backslash character as previously instructed.

Passwords entered as command-line arguments could potentially be seen by other users on the same system, so they are automatically hidden:

	awake@workstation:~$ ps aux | grep freerdp
	awake           22506   0.0  0.1  2502620  10236 s002  S+   11:10pm   0:01.00 xfreerdp /u:JohnDoe /p:************ /d:CONTOSO /v:rdp.contoso.com

### Credentials Prompt

If you omit entering credentials at the command-line, FreeRDP may prompt you for credentials depending on the negotiated protocol security level.

#### Protocol Security

RDP protocol security is confusing for many users because it strongly affects the way credentials can be prompted. There are three main security levels that can be negotiated:

* RDP Security (old encryption, old authentication)
* TLS Security (TLS encryption, old authentication)
* NLA Security (TLS encryption, NLA authentication)

##### Old Authentication

The old RDP authentication mechanism is very simple: the server presents the client with the Winlogon GUI, and the user can either automatically or manually enter the credentials. If you enter credentials prior to connecting to a server with the old authentication, they will be automatically on connection, saving you the trouble of typing them manually.

Old RDP authentication may be practical in the sense that you can get a remote Winlogon GUI without being authenticated on the server. This is however a design flaw which makes the RDP server vulnerable to a DDOS attack: since significant resources need to be allocated for the Winlogon GUI without being authenticated, a distributed denial of service attack could be performed by simply launching multiple unauthenticated connections. This is exactly why it is no longer possible to obtain such a GUI prior to authentication with newer security levels.

##### Network Level Authentication (NLA)

Network Level Authentication (NLA) is required by default with servers starting with Windows Vista. With NLA, authentication is the very first thing that occurs over the wire, such that the server will only allocate resources and present a graphical interface to authenticated clients. It is also much more secure and provides strong defense mechanisms against Man-in-the-Middle (MITM) attacks.

When NLA is negotiated, the complete credentials are needed at connection time, which is why FreeRDP will prompt for the missing information:

	xfreerdp /u:JohnDoe /d:CONTOSO /v:rdp.contoso.com
	connected to rdp.contoso.com
	Password:

## Performance Flags

The RDP performance flags are used by the client to tweak certain remote graphical operations affecting the user experience. A good example is the wallpaper: drawing it requires sending a lot of data as opposed to filling it with black. Using the wallpaper is fast enough on the LAN, but it may negatively affect performance over a slower connection such as over a cellular network. The same principle applies for themes, fonts, menu animations, window dragging, etc.

### Smooth Fonts

Disabled by default, enable with +fonts. Regular RDP fonts are drawn and encoded separately from images sent over the wire, but they have the drawback of not being very crisp and clear. Enabling smooth fonts means you get easier to read and clearer characters (ClearType), but they are sent as images, which may be slower.

### Desktop Composition

Disabled by default, enable with +aero. This should not be confused with the desktop composition extension that redirects compositing calls for local rendering, a feature not supported by FreeRDP. This flag will only work in the few cases where compositing can be rendered over RemoteFX. As for now, this is only possible with Windows 7 SP1 on Hyper-V on Windows Server 2008 R2 SP1 with RemoteFX 3D.

### Full Window Dragging

Disabled by default, enable with +window-drag. Dragging a window around is particularly intensive as it causes a lot of graphical updates (each time you move the window by one pixel, there is a large area of the screen that needs to be updated). To work around this problem, the server can draw the outline of the window as you drag it, and only draw the full window once you are done dragging it.

### Menu Animations

Disabled by default, enable with +menu-anims. Just like window dragging, menu animations may cause a lot of successive graphical updates. Disabling it is a good idea.

### Themes

Enabled by default, disable with -themes. Rich themes usually require operations with bitmaps, while a classic theme can often be drawn with simple and efficient operations using plain colors. Disabling themes is worth it if you can stand the look & feel.

### Wallpaper

Enabled by default, disable with -wallpaper. The wallpaper may look pretty but it is a large image that compresses less efficiently than a plain color background. Disabling it reduce rendering time for the background, which is particularly noticeable at connection time and when minimizing windows.

## Drive Redirection

To redirect all drives, use /drives:

	xfreerdp /v:rdp.contoso.com /drives

On Windows, each drive has a letter and is redirected individually. On Linux, the root directory (/) is redirected, which is equivalent to redirecting all drives. 

To redirect the user home directory as a drive, use /home-drive:

	xfreerdp /v:rdp.contoso.com /home-drive

This is convenient if the user "JohnDoe" wants to redirect only "/home/JohnDoe" instead of the root directory ("/").

## Serial Redirection

To redirect a serial device, you must first identify the corresponding device file. If you are using a USB to serial adapter, the device usually shows up as /dev/ttyUSB0.

In most cases, the device representing the serial device will not be usable with user permissions. You can either chown or chmod the device or do it cleanly with udev rules.

	xfreerdp /serial:COM3,/dev/ttyUSB0 /v:rdp.contoso.com
	
It might be confusing at first, but the redirected serial ports will not appear in the device manager. Instead, open a command prompt and type:

    >change port /query
    AUX = \DosDevices\COM1
    COM1 = \Device\Serial0
    COM2 = \Device\Serial1
    COM3 = \Device\RdpDrPort\;COM3:2\tsclient\COM3
    GLOBALROOT =
    
In this above listing, /dev/ttyUSB0 is redirected as COM3.

You need to manually map the remote COM port to a local COM port:

    net use COMx: \\tsclient\COMy

Where x is a COM port available on the server and y is a COM port available on the client.

![FreeRDP Serial Redirection](images/freerdp_serial_redirection.png "FreeRDP Serial Redirection")

## Parallel Redirection

To be expanded.

## Smartcard Redirection

To be expanded.

## Printer Redirection

To be expanded.

## Clipboard redirection

To enable clipboard redirection, use /clipboard:

	xfreerdp /v:rdp.contoso.com /clipboard

While clipboard redirection is supported in remote desktop mode, it is not yet supported with RemoteApp due to certain technical challenges.

## Audio Playback

To enable sound redirection, use /sound:

	xfreerdp /v:rdp.contoso.com /sound

## Audio Recording

To enable audio input (recording), use /microphone:

	xfreerdp /v:rdp.contoso.com /microphone
