% FreeRDP User Manual
% Marc-André Moreau
% Awake Coding Consulting Inc.

# Introduction

## References

[FreeRDP Developer Manual](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/Configuration/FreeRDP-Developer-Manual.pdf?raw=true "FreeRDP Developer Manual")

[FreeRDP Configuration Manual](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/Configuration/FreeRDP-Configuration-Manual.pdf?raw=true "FreeRDP Configuration Manual")

## Help

FreeRDP - A Free Remote Desktop Protocol Implementation

See www.freerdp.com for more information

	Usage: xfreerdp [file] [options] [/v:<server>[:port]]

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

### Deprecated Options

If the deprecated command-line options are used, FreeRDP warns the user about the deprecation of these options and provides mapping from the old options to the new ones, simplifying migration:

	xfreerdp -f -a 32 --enable-wallpaper --disable-themes rdp.contoso.com
	WARNING: Using deprecated command-line interface!
	-a 32 -> /bpp:32
	-f -> /f
	rdp.contoso.com -> /v:rdp.contoso.com

### Common Pitfalls

Supporting two syntaxes along with automated detection of the deprecated options comes with certain pitfalls for the user. There are currently three possible cases for parsing the command line:

	* New options, windows-style syntax
	* New options, posix-style syntax
	* Old options, posix-style syntax
	
The way parsing works is that FreeRDP attempts parsing the command line according to the three possible cases and counts the number of accepted options. The command line is then parsed again for real based on these results. Since the old options had restrictions on the positions of certain arguments like the target server that are not present, this difference is also used to facilitate proper detection of the syntax and options in use.

Since the command line is parsed according to only one syntax and option set at a time, one *cannot* mix syntaxes and options that belong to different cases. The following example shows incorrect mixing of the command-line syntaxes that will lead to incorrect parsing of some of the options:

	xfreerdp /f --bpp 32 -v rdp.contoso.com +wallpaper -themes

A valid command line for the above example needs to be either one of the following:

	xfreerdp /f /bpp:32 /v:rdp.contoso.com +wallpaper -themes
	xfreerdp -f --bpp 32 -v rdp.contoso.com --enable-wallpaper --disable-themes

Another common mistake made by users migrating from the old options is to put the target server name as the last argument without an option name:

	xfreerdp -f --bpp 32 --enable-wallpaper --disable-themes rdp.contoso.com
	WARNING: Using deprecated command-line interface!
	-f -> /f
	rdp.contoso.com -> /v:rdp.contoso.com

The correct command would be:

	xfreerdp -f --bpp 32 --enable-wallpaper --disable-themes -v rdp.contoso.com

With the new set of options, never forget to use "v" for the target server, otherwise your command line will be interpreted as using the deprecated interface.

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

# Authentication

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

## Credentials Prompt

If you omit entering credentials at the command-line, FreeRDP may prompt you for credentials depending on the negotiated protocol security level.

### Protocol Security

RDP protocol security is confusing for many users because it strongly affects the way credentials can be prompted. There are three main security levels that can be negotiated:

* RDP Security (old encryption, old authentication)
* TLS Security (TLS encryption, old authentication)
* NLA Security (TLS encryption, NLA authentication)

#### Old Authentication

The old RDP authentication mechanism is very simple: the server presents the client with the Winlogon GUI, and the user can either automatically or manually enter the credentials. If you enter credentials prior to connecting to a server with the old authentication, they will be automatically on connection, saving you the trouble of typing them manually.

Old RDP authentication may be practical in the sense that you can get a remote Winlogon GUI without being authenticated on the server. This is however a design flaw which makes the RDP server vulnerable to a DDOS attack: since significant resources need to be allocated for the Winlogon GUI without being authenticated, a distributed denial of service attack could be performed by simply launching multiple unauthenticated connections. This is exactly why it is no longer possible to obtain such a GUI prior to authentication with newer security levels.

![Winlogon GUI](images/winlogon_gui.png "Winlogon GUI")

#### Network Level Authentication (NLA)

Network Level Authentication (NLA) is required by default with servers starting with Windows Vista. With NLA, authentication is the very first thing that occurs over the wire, such that the server will only allocate resources and present a graphical interface to authenticated clients. It is also much more secure and provides strong defense mechanisms against Man-in-the-Middle (MITM) attacks.

When NLA is negotiated, the complete credentials are needed at connection time, which is why FreeRDP will prompt for the missing information:

	xfreerdp /u:JohnDoe /d:CONTOSO /v:rdp.contoso.com
	connected to rdp.contoso.com
	Password:

# Performance Flags

The RDP performance flags are used by the client to tweak certain remote graphical operations affecting the user experience. A good example is the wallpaper: drawing it requires sending a lot of data as opposed to filling it with black. Using the wallpaper is fast enough on the LAN, but it may negatively affect performance over a slower connection such as over a cellular network. The same principle applies for themes, fonts, menu animations, window dragging, etc.

## Smooth Fonts

Disabled by default, enable with +fonts. Regular RDP fonts are drawn and encoded separately from images sent over the wire, but they have the drawback of not being very crisp and clear. Enabling smooth fonts means you get easier to read and clearer characters (ClearType), but they are sent as images, which may be slower.

![With Smooth Fonts](images/with_smooth_fonts.png "With Smooth Fonts")
![Without Smooth Fonts](images/without_smooth_fonts.png "Without Smooth Fonts")

## Desktop Composition

Disabled by default, enable with +aero. This should not be confused with the desktop composition extension that redirects compositing calls for local rendering, a feature not supported by FreeRDP. This flag will only work in the few cases where compositing can be rendered over RemoteFX. As for now, this is only possible with Windows 7 SP1 on Hyper-V on Windows Server 2008 R2 SP1 with RemoteFX 3D.

## Full Window Dragging

Disabled by default, enable with +window-drag. Dragging a window around is particularly intensive as it causes a lot of graphical updates (each time you move the window by one pixel, there is a large area of the screen that needs to be updated). To work around this problem, the server can draw the outline of the window as you drag it, and only draw the full window once you are done dragging it.

## Menu Animations

Disabled by default, enable with +menu-anims. Just like window dragging, menu animations may cause a lot of successive graphical updates. Disabling it is a good idea.

## Themes

Enabled by default, disable with -themes. Rich themes usually require operations with bitmaps, while a classic theme can often be drawn with simple and efficient operations using plain colors. Disabling themes is worth it if you can stand the look & feel.

![With Themes](images/with_themes.png "With Themes")
![Without Themes](images/without_themes.png "Without Themes")

## Wallpaper

Enabled by default, disable with -wallpaper. The wallpaper may look pretty but it is a large image that compresses less efficiently than a plain color background. Disabling it reduce rendering time for the background, which is particularly noticeable at connection time and when minimizing windows.

# Input

Keyboard mapping is done on the remote end, so the local keyboard layout is ignored. Instead, a Windows keyboard layout id is provided at connection time to tell the server which keyboard layout to use.

FreeRDP accepts either the numerical keyboard id or the full name of the corresponding keyboard layout:

    xfreerdp /v:rdp.contoso.com /kbd:US
    xfreerdp /v:rdp.contoso.com /kbd:0x409

    xfreerdp /v:rdp.contoso.com "/kbd:Canadian Multilingual Standard"
    xfreerdp /v:rdp.contoso.com /kbd:0x11009

![Language Bar](images/language_bar.png "Language Bar")

If no keyboard layout is specified, FreeRDP selects a keyboard layout based on local system settings. The Microsoft RDP server only accepts the keyboard layout on session creation: if you are reconnecting to an existing session, you will need to log out first.

The list of keyboard layout ids can be shown by using /kbd-list:

    xfreerdp /kbd-list
    
    Keyboard Layouts
    0x00000401	Arabic (101)
    0x00000402	Bulgarian
    0x00000404	Chinese (Traditional) - US Keyboard
    0x00000405	Czech
    0x00000406	Danish
    0x00000407	German
    0x00000408	Greek
    0x00000409	US
    ....

One can search for his own keyboard layout by combining the above command with grep:

    xfreerdp /kbd-list | grep "Canadian"
    0x00000C0C	Canadian French (legacy)
    0x00001009	Canadian French
    0x00011009	Canadian Multilingual Standard

## Keyboard Layouts

| Id         | Name                                   |
|------------|----------------------------------------|
| 0x00000401 | Arabic (101) |
| 0x00000402 | Bulgarian |
| 0x00000404 | Chinese (Traditional) - US Keyboard |
| 0x00000405 | Czech |
| 0x00000406 | Danish |
| 0x00000407 | German |
| 0x00000408 | Greek |
| 0x00000409 | US |
| 0x0000040A | Spanish |
| 0x0000040B | Finnish |
| 0x0000040C | French |
| 0x0000040D | Hebrew |
| 0x0000040E | Hungarian |
| 0x0000040F | Icelandic |
| 0x00000410 | Italian |
| 0x00000411 | Japanese |
| 0x00000412 | Korean |
| 0x00000413 | Dutch |
| 0x00000414 | Norwegian |
| 0x00000415 | Polish (Programmers) |
| 0x00000416 | Portuguese (Brazilian ABNT) |
| 0x00000418 | Romanian |
| 0x00000419 | Russian |
| 0x0000041A | Croatian |
| 0x0000041B | Slovak |
| 0x0000041C | Albanian |
| 0x0000041D | Swedish |
| 0x0000041E | Thai Kedmanee |
| 0x0000041F | Turkish Q |
| 0x00000420 | Urdu |
| 0x00000422 | Ukrainian |
| 0x00000423 | Belarusian |
| 0x00000424 | Slovenian |
| 0x00000425 | Estonian |
| 0x00000426 | Latvian |
| 0x00000427 | Lithuanian IBM |
| 0x00000429 | Farsi |
| 0x0000042A | Vietnamese |
| 0x0000042B | Armenian Eastern |
| 0x0000042C | Azeri Latin |
| 0x0000042F | FYRO Macedonian |
| 0x00000437 | Georgian |
| 0x00000438 | Faeroese |
| 0x00000439 | Devanagari - INSCRIPT |
| 0x0000043A | Maltese 47-key |
| 0x0000043B | Norwegian with Sami |
| 0x0000043F | Kazakh |
| 0x00000440 | Kyrgyz Cyrillic |
| 0x00000444 | Tatar |
| 0x00000445 | Bengali |
| 0x00000446 | Punjabi |
| 0x00000447 | Gujarati |
| 0x00000449 | Tamil |
| 0x0000044A | Telugu |
| 0x0000044B | Kannada |
| 0x0000044C | Malayalam |
| 0x0000044E | Marathi |
| 0x00000450 | Mongolian Cyrillic |
| 0x00000452 | United Kingdom Extended |
| 0x0000045A | Syriac |
| 0x00000461 | Nepali |
| 0x00000463 | Pashto |
| 0x00000465 | Divehi Phonetic |
| 0x0000046E | Luxembourgish |
| 0x00000481 | Maori |
| 0x00000804 | Chinese (Simplified) - US Keyboard |
| 0x00000807 | Swiss German |
| 0x00000809 | United Kingdom |
| 0x0000080A | Latin American |
| 0x0000080C | Belgian French |
| 0x00000813 | Belgian (Period) |
| 0x00000816 | Portuguese |
| 0x0000081A | Serbian (Latin) |
| 0x0000082C | Azeri Cyrillic |
| 0x0000083B | Swedish with Sami |
| 0x00000843 | Uzbek Cyrillic |
| 0x0000085D | Inuktitut Latin |
| 0x00000C0C | Canadian French (legacy) |
| 0x00000C1A | Serbian (Cyrillic) |
| 0x00001009 | Canadian French |
| 0x0000100C | Swiss French |
| 0x0000141A | Bosnian |
| 0x00001809 | Irish |
| 0x0000201A | Bosnian Cyrillic |

## Keyboard Layout Variants

| Id         | Name                                   |
|------------|----------------------------------------|
| 0x00010401 | Arabic (102) |
| 0x00010402 | Bulgarian (Latin) |
| 0x00010405 | Czech (QWERTY) |
| 0x00010407 | German (IBM) |
| 0x00010408 | Greek (220) |
| 0x00010409 | United States-Dvorak |
| 0x0001040A | Spanish Variation |
| 0x0001040E | Hungarian 101-key |
| 0x00010410 | Italian (142) |
| 0x00010415 | Polish (214) |
| 0x00010416 | Portuguese (Brazilian ABNT2) |
| 0x00010419 | Russian (Typewriter) |
| 0x0001041B | Slovak (QWERTY) |
| 0x0001041E | Thai Pattachote |
| 0x0001041F | Turkish F |
| 0x00010426 | Latvian (QWERTY) |
| 0x00010427 | Lithuanian |
| 0x0001042B | Armenian Western |
| 0x00010439 | Hindi Traditional |
| 0x0001043A | Maltese 48-key |
| 0x0001043B | Sami Extended Norway |
| 0x00010445 | Bengali (Inscript) |
| 0x0001045A | Syriac Phonetic |
| 0x00010465 | Divehi Typewriter |
| 0x0001080C | Belgian (Comma) |
| 0x0001083B | Finnish with Sami |
| 0x00011009 | Canadian Multilingual Standard |
| 0x00011809 | Gaelic |
| 0x00020401 | Arabic (102) AZERTY |
| 0x00020405 | Czech Programmers |
| 0x00020408 | Greek (319) |
| 0x00020409 | United States-International |
| 0x0002041E | Thai Kedmanee (non-ShiftLock) |
| 0x0002083B | Sami Extended Finland-Sweden |
| 0x00030408 | Greek (220) Latin |
| 0x00030409 | United States-Dvorak for left hand |
| 0x0003041E | Thai Pattachote (non-ShiftLock) |
| 0x00040408 | Greek (319) Latin |
| 0x00040409 | United States-Dvorak for right hand |
| 0x00050408 | Greek Latin |
| 0x00050409 | US English Table for IBM Arabic 238_L |
| 0x00060408 | Greek Polytonic |
| 0xB0000407 | German Neo |

## Keyboard Input Method Editors (IMEs)

| Id         | Name                                   |
|------------|----------------------------------------|
| 0xE0010404 | Chinese (Traditional) - Phonetic |
| 0xE0010411 | Japanese Input System (MS-IME2002) |
| 0xE0010412 | Korean Input System (IME 2000) |
| 0xE0010804 | Chinese (Simplified) - QuanPin |
| 0xE0020404 | Chinese (Traditional) - ChangJie |
| 0xE0020804 | Chinese (Simplified) - ShuangPin |
| 0xE0030404 | Chinese (Traditional) - Quick |
| 0xE0030804 | Chinese (Simplified) - ZhengMa |
| 0xE0040404 | Chinese (Traditional) - Big5 Code |
| 0xE0050404 | Chinese (Traditional) - Array |
| 0xE0050804 | Chinese (Simplified) - NeiMa |
| 0xE0060404 | Chinese (Traditional) - DaYi |
| 0xE0070404 | Chinese (Traditional) - Unicode |
| 0xE0080404 | Chinese (Traditional) - New Phonetic |
| 0xE0090404 | Chinese (Traditional) - New ChangJie |
| 0xE00E0804 | Chinese (Traditional) - Microsoft Pinyin IME 3.0 |
| 0xE00F0404 | Chinese (Traditional) - Alphanumeric |

# Redirection

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

To redirect all printers, use /printer:

    xfreerdp /v:rdp.contoso.com /printer
    
On Linux and UNIX systems, CUPS is the printing backend used. An easy way to test printing without a physical printer is to install [CUPS-PDF](http://www.cups-pdf.de/ ""), a simple CUPS pdf printer.

![FreeRDP Printer Redirection](images/freerdp_print_cups_pdf.png "FreeRDP Printer Redirection")

## Clipboard redirection

To enable clipboard redirection, use /clipboard:

	xfreerdp /v:rdp.contoso.com /clipboard

While clipboard redirection is supported in remote desktop mode, it is not yet supported with RemoteApp due to certain technical challenges.

## Audio Playback

To enable sound redirection, use /sound:

	xfreerdp /v:rdp.contoso.com /sound
	
To select a specific sound subsystem, use the sys:<subsystem> parameter:

	xfreerdp /v:rdp.contoso.com /sound:sys:alsa
	xfreerdp /v:rdp.contoso.com /sound:sys:pulse

If you experience occasional sound skipping, you may try adjusting the sound latency with the latency:<milliseconds> parameter:

	xfreerdp /v:rdp.contoso.com /sound:latency:400

A short latency will give better audio and video synchronization but will have a shorter buffering time, which makes sound skipping more likely.

## Audio Recording

To enable audio input (recording), use /microphone:

	xfreerdp /v:rdp.contoso.com /microphone
	
To select a specific sound subsystem, use the sys:<subsystem> parameter:

	xfreerdp /v:rdp.contoso.com /microphone:sys:alsa
	xfreerdp /v:rdp.contoso.com /microphone:sys:pulse

## Multitouch Input

Multitouch redirection was introduced in RDP8 and is therefore only supported with Windows 8 and Windows Server 2012 servers. If you have a multitouch display, you can enable true multitouch redirection using /multitouch:

	xfreerdp /v:rdp.contoso.com /multitouch
	
RDP8 multitouch is meant for *direct* touch devices like multitouch displays and not *dependent* touch devices like multitouch trackpads.

![FreeRDP Multitouch Input](images/freerdp_multitouch.png "FreeRDP Multitouch Input")

# Registry Settings

FreeRDP supports configuration through registry keys using the WinPR Registry API. On Windows, the native Windows registry is used. On other platforms, WinPR uses a simple .reg file.

![FreeRDP Windows Registry Settings](images/windows_registry.png "FreeRDP Windows Registry Settings")

Most settings are found under [HKEY_LOCAL_MACHINE\\Software\\FreeRDP] and [HKEY_LOCAL_MACHINE\\Software\\WinPR]. On Windows, use regedit.exe to edit the registry settings. On other operating systems, WinPR looks for a file called /etc/winpr/HKLM.reg. This file is in the .reg file format and can be edited manually with a text editor. On Windows, .reg files can be obtained by exporting a section of the registry in regedit.exe. To do so, right-click the key in the left pane and select Export. The resulting .reg file is shown in the above screenshot. This textual file can then serve as a template for non-Windows usage.

On non-Windows systems, the /etc/winpr folder usually needs to be created manually. It is recommended to restrict permissions to this folder due to the sensitive nature of certain configuration settings. Current FreeRDP registry settings are all under HKEY_LOCAL_MACHINE, the registry hive meant for system-wide configuration. In the future, user-specific settings may be added under HKEY_LOCAL_USERS, but this has not been done yet.

    sudo mkdir /etc/winpr
    sudo nano /etc/winpr/HKLM.reg
    
![FreeRDP Linux Registry Settings](images/linux_registry.png "FreeRDP Linux Registry Settings")

## .reg File Format

The .reg file format is normally used for exporting and exporting registry settings, and is well described in the [Microsoft Knowledge Base Article 310516](http://support.microsoft.com/kb/310516 ""). It begins with a line containing the file format name and version number, followed by an empty line:

    Windows Registry Editor Version 5.00

Registry "keys" correspond to the folders in the registry hierarchy. A key can have subkeys or values. Each value in the registry is strongly typed. Common types are REG_DWORD, REG_BINARY, and REG_SZ.

Here is a sample .reg file containing a test key with a subkey, and values of type REG_DWORD, REG_BINARY and REG_SZ:

    Windows Registry Editor Version 5.00

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Test]
    "DwordValue"=dword:0000007b
    "StringValue"="this is a string"

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Test\Subkey]
    "BinaryValue"=hex:aa,bb,cc,dd,ee,ff

### REG_DWORD (Integer)

REG_DWORD is a double word, or a 32-bit unsigned integer. It is used for numbers and also for boolean values. If the value is to be interpreted as boolean, 0 is considered FALSE and non-zero is considered TRUE. REG_DWORD values are formatted as 8 hexadecimal characters, so make sure to write a value in base 16 and not in base 10 when editing manually. In this case, 0000007b is hexadecimal for 123 in decimal.

### REG_SZ (String)

REG_SZ is a text string. Windows exports unicode strings as REG_BINARY.

### REG_BINARY (Binary Data)

REG_BINARY is either raw data or a unicode string. It is exported as a list of hexadecimal values separated by commas.

## Client Settings

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Client]

| Value                       | Type    | Description                                         |
|-----------------------------|---------|-----------------------------------------------------|
| DesktopWidth                | Integer | Default desktop width (/w)                          |
| DesktopHeight               | Integer | Default desktop height (/h)                         |
| Fullscreen                  | Boolean | Toggle Fullscreen mode (/f)                         |
| ColorDepth                  | Integer | Default color depth (/bpp)                          |
| KeyboardType                | Integer | Default keyboard type (/kbd-type)                   |
| KeyboardSubType             | Integer | Default keyboard subtype (/kbd-subtype)             |
| KeyboardFunctionKeys        | Integer | Default keyboard function keys (/kbd-fn-key)        |
| KeyboardLayout              | Integer | Default keyboard layout id (/kbd)                   |
| ExtSecurity                 | Boolean | Extended security (/sec-ext)                        |
| NlaSecurity                 | Boolean | Toggle NLA security (/sec-nla)                      |
| TlsSecurity                 | Boolean | Toggle TLS security (/sec-tls)                      |
| RdpSecurity                 | Boolean | Toggle Standard RDP security (/sec-rdp)             |
| MstscCookieMode             | Boolean | Toggle connection cookie truncation to 9 characters |
| CookieMaxLength             | Integer | Maximum connection cookie length for truncation     |
| BitmapCache                 | Boolean | Toggle bitmap cache (/bitmap-cache)                 |
| OffscreenBitmapCache        | Boolean | Toggle offscreen bitmap cache (/offscreen-cache)    |
| OffscreenBitmapCacheSize    | Integer | Offscreen bitmap cache size                         |
| OffscreenBitmapCacheEntries | Integer | Offscreen bitmap cache entry count                  |
| GlyphCache                  | Boolean | Toggle glyph cache (/glyph-cache)                   |

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Client\BitmapCacheV2]

| Value                       | Type    | Description                                  |
|-----------------------------|---------|----------------------------------------------|
| NumCells                    | Integer | Number of cells in bitmap cache              |
| Cell0NumEntries             | Integer | Number of entries in bitmap cache cell 0     |
| Cell0Persistent             | Boolean | Toggle persistence for bitmap cache cell 0   |
| Cell1NumEntries             | Integer | Number of entries in bitmap cache cell 1     |
| Cell1Persistent             | Boolean | Toggle persistence for bitmap cache cell 1   |
| Cell2NumEntries             | Integer | Number of entries in bitmap cache cell 2     |
| Cell2Persistent             | Boolean | Toggle persistence for bitmap cache cell 2   |
| Cell3NumEntries             | Integer | Number of entries in bitmap cache cell 3     |
| Cell3Persistent             | Boolean | Toggle persistence for bitmap cache cell 3   |
| Cell4NumEntries             | Integer | Number of entries in bitmap cache cell 4     |
| Cell4Persistent             | Boolean | Toggle persistence for bitmap cache cell 4   |
| AllowCacheWaitingList       | Boolean | Allow bitmap cache waiting list              |

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Client\GlyphCache]

| Value                       | Type    | Description                                  |
|-----------------------------|---------|----------------------------------------------|
| SupportLevel                | Integer | Glyph cache support level                    |
| Cache0NumEntries            | Integer | Number of entries in glyph cache cell 0      |
| Cache0MaxCellSize           | Integer | Glyph cache cell 0 maximum size              |
| Cache1NumEntries            | Integer | Number of entries in glyph cache cell 1      |
| Cache1MaxCellSize           | Integer | Glyph cache cell 1 maximum size              |
| Cache2NumEntries            | Integer | Number of entries in glyph cache cell 2      |
| Cache2MaxCellSize           | Integer | Glyph cache cell 2 maximum size              |
| Cache3NumEntries            | Integer | Number of entries in glyph cache cell 3      |
| Cache3MaxCellSize           | Integer | Glyph cache cell 3 maximum size              |
| Cache4NumEntries            | Integer | Number of entries in glyph cache cell 4      |
| Cache4MaxCellSize           | Integer | Glyph cache cell 4 maximum size              |
| Cache5NumEntries            | Integer | Number of entries in glyph cache cell 5      |
| Cache5MaxCellSize           | Integer | Glyph cache cell 5 maximum size              |
| Cache6NumEntries            | Integer | Number of entries in glyph cache cell 6      |
| Cache6MaxCellSize           | Integer | Glyph cache cell 6 maximum size              |
| Cache7NumEntries            | Integer | Number of entries in glyph cache cell 7      |
| Cache7MaxCellSize           | Integer | Glyph cache cell 7 maximum size              |
| Cache8NumEntries            | Integer | Number of entries in glyph cache cell 8      |
| Cache8MaxCellSize           | Integer | Glyph cache cell 8 maximum size              |
| Cache9NumEntries            | Integer | Number of entries in glyph cache cell 9      |
| Cache9MaxCellSize           | Integer | Glyph cache cell 9 maximum size              |
| FragCacheNumEntries         | Integer | Number of entries in glyph fragment cache    |
| FragCacheMaxCellSize        | Integer | Glyph fragment cache cell maximum size       |

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Client\PointerCache]

| Value                       | Type    | Description                                 |
|-----------------------------|---------|---------------------------------------------|
| LargePointer                | Boolean | Large pointer support                       |
| ColorPointer                | Boolean | Color pointer support                       |
| PointerCacheSize            | Integer | Pointer cache size                          |

## Server Settings

    [HKEY_LOCAL_MACHINE\SOFTWARE\FreeRDP\Server]

| Value                      | Type    | Description                                  |
|----------------------------|---------|----------------------------------------------|
| ExtSecurity                | Boolean | Extended security                            |
| NlaSecurity                | Boolean | Toggle NLA security                          |
| TlsSecurity                | Boolean | Toggle TLS security                          |
| RdpSecurity                | Boolean | Toggle Standard RDP security                 |

