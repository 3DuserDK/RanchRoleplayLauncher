@echo off
REM To make life easier when i wanna play RedM i Created this small batch file
REM simply check if a process is running if not it runs it
color 2
echo:
echo:
echo             --------------------------------
echo             RedM Ranchroleplay Launcher 0.9
echo                    Made by Who_Cares
echo             --------------------------------
echo:
echo:
echo Following will need to run
echo:
echo   --  Discord - Demanded by RedM
echo   --  Steam - Demanded by RedM
echo   --  Rockstar - Demanded by RedM
echo   --  Teamspeak 3 - Demanded by RedM
echo   --  RedM - Connects to Ranchroleplay.com
echo: 
echo:
echo       TEAMSPEAK
echo       REMEBER TO HAVE RANCHROLEPLAY AS A BOOKMARK IN TEAMSPEAK 3 AND TICKED OF THE OPTION TO CONNECT
echo       TO THE BOOKMARK ON START UP.
echo:
echo       ROCKSTAR
echo       ACTIVATE AUTOLOGIN FOR THE ROCKSTAR APP LOGIN TO YOUR ACCOUNT
echo:
echo Be patient depending on your pc this will take a minute or two
echo we are first looking to see if the program runs if not we will find
echo the program and start it up.
timeout /t 2 > nul
echo:
CLS
echo:
echo:
echo             --------------------------------
echo             RedM Ranchroleplay Launcher 0.9
echo                    Made by Who_Cares
echo             --------------------------------
echo:
echo:
echo Following will need to run
echo:
echo   --  Discord - Demanded by RedM
echo   --  Steam - Demanded by RedM
echo   --  Rockstar - Demanded by RedM
echo   --  Teamspeak 3 - Demanded by RedM
echo   --  RedM - Connects to Ranchroleplay.com
echo: 
echo:
REM Lets give the bat file some variables so it knows which program we are running 
SET Discord=Discord\Update.exe
SET Steam=Steam.exe
SET Rockstar=Rockstar Games\Launcher\LauncherPatcher.exe
SET Teamspeak=ts3client_win64.exe
SET RedM=RedM.exe

REM Lets make the bat file search if the program are already running, if not then search for the .exe file it
REM needs to run it. It search the intire C drive since that is the most likely place where the .exe file is stored.
REM Ii would be alot faster to search the regedit /ROOT to see if was installed get the path there and run it
REM however
:Discord

Set "MyProcess=Discord.exe"
tasklist /NH /FI "imagename eq %MyProcess%" 2>nul |find /i "%MyProcess%">nul
If not errorlevel 1 GOTO :DISCORDrunning else GOTO :startDISCORD

:startDISCORD
FOR /R C:\ %%a IN (\) DO (
   IF EXIST "%%a\%Discord%" (

      SET fullpath=%%a%Discord%
      GOTO break
   )
)
:break

echo    --  Discord are running 
GOTO :Steam
start "Discord" "%fullpath%" --processStart Discord.exe
GOTO :Steam

:DISCORDrunning
echo    --  Discord are running


REM lets do the same for steam but lets open it in miniced window

:Steam
Set "MyProcess=Steam.exe"
tasklist /NH /FI "imagename eq %MyProcess%" 2>nul |find /i "%MyProcess%">nul
If not errorlevel 1 GOTO :STEAMrunning else GOTO :startSTEAM


:startSTEAM
FOR /R C:\ %%a IN (\) DO (
   IF EXIST "%%a\%Steam%" (

      SET fullpath=%%a%Steam%
      GOTO break
   )
)
:break
echo    --  Steam are running 
start "Steam" "%fullpath%" -nochatui -nofriendsui -silent
:STEAMrunning
echo    --  Steam are running

:Rockstar

Set "MyProcess=RockstarService.exe"
tasklist /NH /FI "imagename eq %MyProcess%" 2>nul |find /i "%MyProcess%">nul
If not errorlevel 1 GOTO :ROCKSTARrunning else GOTO :startROCKSTAR

:startROCKSTAR
FOR /R C:\ %%a IN (\) DO (
   IF EXIST "%%a\%Rockstar%" (

      SET fullpath=%%a%Rockstar%
      GOTO break
   )
)
:break
start "Rockstar" "%fullpath%"
echo    --  Rockstar are running
GOTO :Teamspeak

:ROCKSTARrunning

echo    --  Rockstar are running


:Teamspeak
REM lets get teamspeak client up running

Set "MyProcess=ts3client_win64.exe"
tasklist /NH /FI "imagename eq %MyProcess%" 2>nul |find /i "%MyProcess%">nul
If not errorlevel 1 GOTO :TEAMSPEAKrunning else GOTO :startTEAMSPEAK


:startTEAMSPEAK
FOR /R C:\ %%a IN (\) DO (
   IF EXIST "%%a\%Teamspeak%" (

      SET fullpath=%%a%Teamspeak%
      GOTO break
   )
)
:break

start "Teamspeak" "%fullpath%"
echo    --  Teamspeak are running
GOTO :RedM
:TEAMSPEAKrunning
echo    --  Teamspeak are running


:RedM

Set "MyProcess=RedM.exe"
tasklist /NH /FI "imagename eq %MyProcess%" 2>nul |find /i "%MyProcess%">nul
If not errorlevel 1 GOTO :REDMrunning else GOTO :startREDM

:startREDM
FOR /R C:\ %%a IN (\) DO (
   IF EXIST "%%a\%RedM%" (

      SET fullpath=%%a%RedM%
      GOTO break
   )
)
:break
start "RedM" "%fullpath%" +connect play.ranchroleplay.com

echo    --  RedM are running
GOTO :ALLrunning
:REDMrunning
echo    --  RedM are running

:ALLrunning
echo:
echo:
echo     -- All is running - Remember be nice play fair

timeout /t 15 > nul
:exit
exit
