@echo off
:: This header is required by Check_MK to identify the data
echo ^<^<^<windows_sessions^>^>^>

:: I use information in systeminfo to find out if I'm x84 or x64.  Cache This
:: info for later, since it can take some time to generate.
IF EXIST %TEMP%\systeminfo.txt GOTO FOUNDSYSINFO
systeminfo > %TEMP%\systeminfo.txt

:FOUNDSYSINFO
type %TEMP%\systeminfo.txt | find "System" | find "X86" > nul
if %ERRORLEVEL% == 0 goto ver_32bit

type %TEMP%\systeminfo.txt | find "System" | find "x64" > nul
if %ERRORLEVEL% == 0 goto ver_64bit
GOTO REALEND

:ver_32bit
qwinsta
GOTO REALEND

:ver_64bit
:: A work-around for x64 computers (specifically, Win7 x64)..  some issue with 64 bit execution in 32 bit application.
:: See .. http://www.velocityreviews.com/forums/t686141-syswow64-redirection-for-cmd-exe.html and so many more
IF NOT EXIST %windir%\Sysnative\qwinsta.exe qwinsta
IF EXIST %windir%\Sysnative\qwinsta.exe %windir%\Sysnative\qwinsta.exe
GOTO REALEND

:REALEND
