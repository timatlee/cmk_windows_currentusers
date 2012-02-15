A plugin for Check_MK to monitor active sessions on Windows hosts

This plugin does not require any additional tools on the Windows clients to operate.

Tested with:
- Windows XP
- Windows 7 Enterprise x64
- Windows Server 2003 x64
- Windows Server 2008 x64

Installation:
- Copy "windows_sessions.cmd" from the "client-plugin" folder to the \Check_MK\plugins\ directory
- Copy "windows_sessions" from the "cmk_plugin" folder to the local checks directory in cmk
  (~/local/share/check_mk/checks/ under OMD)

Restart the Windows Check_MK agent
Inventory host (cmk -I <host>)
Precompile config and reload (cmk -O)

Check_MK is avaliable at: http://mathias-kettner.de/check_mk.html

Issues:
- Non-english versions of Windows will cause the plugin to return "No users logged in".  This is due
  to the cmk plugin looking for english version of "Active", "Disconnected" and so on.
  Thank you Timo Scheller for finding this one.
