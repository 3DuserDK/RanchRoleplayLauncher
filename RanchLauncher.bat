@echo off
::////////////////////////////////////////////////////////////////////////////////
REM This is an update of the original RanchRPlauncher.bat I realiazed that
REM it would be much more aprobiate to just launch the programs from the Desktop
REM links since 99% of people will have a link to each program there.
REM I also added a few more functions such as checkink if the programs have a link
REM on the Desktop.
::////////////////////////////////////////////////////////////////////////////////
::
::
REM YOU MAY EDIT THIS FILE TO YOUR LIKING HOWEVER YOU MAY NOT
REM REMOVE MY CREDENTIALS OR USE IT FOR OTHER USE THATN IT IS INTENDED
REM WHICH IS TO CONNECT TO THE **RANCHROLEPLAYER.COM** SERVER
::
::
REM ###############################################################
REM WE NEED THE .BAT FILE TO DO SEVERAL SIMPLE THINGS. IT NEEDS TO
REM CHECK IF "STEAM,ROCKSTAR,DISCORD,TEAMSPEAK AND REDM HAVE A LINK
rem ON THE DESKTOP. THEN IT NEEDS TO CHECK IF THE PROGRAMS ARE RUNNING
REM IF NOT THEN START THE PROGRAMS. AFTER THAT IT NEEDS TO START ALOVER
REM AGAIN IF THE GAME CRASHES OR THE SERVER RESTARTS.
REM ################################################################

color 2
echo:
echo:
echo             --------------------------------
echo             RedM Ranchroleplay Launcher 1.0
echo                    Made by Who_Cares
echo                   -- Beta Version --
echo             --------------------------------
echo       This is not an official Ranchroleplay Product
echo:
echo:
:CheckIfExist
if not exist "%USERPROFILE%\Desktop\Rockstar Games Launcher.lnk" GOTO :NoRockstar
if not exist %USERPROFILE%\Desktop\Discord.lnk GOTO :NoDiscord
if not exist C:\Users\Public\Desktop\Steam.lnk GOTO :NoSteam
if not exist "C:\Users\Public\Desktop\TeamSpeak 3 Client.lnk" GOTO :NoTeamspeak
if not exist %USERPROFILE%\Desktop\RedM.lnk GOTO :NoRedM

GOTO :StartOver
:NoRockstar
echo:
echo:
echo ROCKSTAR NOT FOUND - MAKE SURE ROCKSTAR GAME LAUNCHER IS INSTALLED
echo:
echo AND THERE IS A LINK ON THE DESKTOP CALLED (Rockstar Games Launcher.lnk)
pause
goto :exit
:NoDiscord
echo:
echo:
echo DISCORD NOT FOUND - MAKE SURE DISCORD IS INSTALLED 
echo:
echo AND THERE IS A LINK ON THE DESKTOP CALLED (Discord.lnk)
echo:
echo:
pause
goto :exit
:NoSteam
echo:
echo:
echo Ranchroleplay.com require you have Steam to be Installed
echo RanchRPLauncher require (TeamSpeak 3 Client.lnk) located on Desktop
echo 
pause
goto :exit
:NoTeamSpeak
echo:
echo:
echo Ranchroleplay.com require Teamspeak Client 3 to be Installed
echo RanchRPLauncher require TeamSpeak Link located on the desktop
pause
goto :exit
:NoRedM
echo:
echo:
echo Ranchroleplay.com require RedM is nstalled onthe computer
echo RanchRPLauncher require RedM is located on the desktop
pause
goto :Exit

:StartOver
::++++++++++++++++++++++++++++++++++++++++++++++++++
::        Let's start with defining 
::        the variables, we will use to
::        print if the programs is running
::        or Starting up
::++++++++++++++++++++++++++++++++++++++++++++++

set VPNst= ** Starting Up VPN **
set VPNrn= ** ExpressVPN is running **
set Medalst= ** Starting Up Medal.tv **
set Medalrn= ** Medal.tv is Running **
set Rockst= ** Starting Up Rockstar **
set Rockrn= ** Rockstar is running **
set Discordst= ** Starting Up Discord **
set Discordrn= ** Discord is Running **
set Steamst= ** Starting Up Steam **
set Steamrn= ** Steam is running **
set Teamspeakst= ** Starting Up Teamspeak **
set Teamspeakrn= ** Teamspeak is Running **
set RedMst= ** Starting Up RedM **
set RedMrn= ** Starting Up RedM **






::--------------- START OF THE SECTION -----------------------
::  Lets look for the variable in tasklist
::  if it runs it's in there. If not we wanna start it.

:VPN
if not exist C:\Users\Public\Desktop\ExpressVPN.lnk goto Medal.Tv

set VPNPath=C:\Users\Public\Desktop\ExpressVPN.lnk
Set "VPNProcess=ExpressVPN.exe"



tasklist /NH /FI "imagename eq %VPNProcess%" 2>nul |find /i "%VPNProcess%">nul
If not errorlevel 1 GOTO :VPNRunning else GOTO :StartVPN

:StartVPN
start "VPN" "%VPNPath%
echo %VPNst%
GOTO :Medal.Tv

:VPNRunning
echo %VPNrn%

::------------------ END OF THE SECTION -----------------------


::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
::+++++++ NOW WE REPEAT THE SAME PROCESS BUT WITH ++++++++++++
::+++++++ MEDAL.TV                                ++++++++++++
::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:Medal.Tv
if not exist %USERPROFILE%\Desktop\Medal.lnk goto :Rockstart
SET MedalTvPath=%USERPROFILE%\Desktop\Medal.lnk
Set "MDLProcess=Medal.exe"
tasklist /NH /FI "imagename eq %MDLProcess%" 2>nul |find /i "%MDLProcess%">nul
If not errorlevel 1 GOTO :MedalRunning else GOTO :StartMedal

:StartMedal
timeout /t 10 > nul
start "Medal" "%MedalTvPath%"
echo %Medalst%
GOTO Rockstar

:MedalRunning
echo %Medalrn%

::----------------- ROCKSTAR ------------------
:Rockstar
if not exist "%USERPROFILE%\Desktop\Rockstar Games Launcher.lnk" goto :NoRockstar
Set "RCKProcess=RockstarService.exe"
set RockstarPath=%USERPROFILE%\Desktop\Rockstar Games Launcher.lnk
tasklist /NH /FI "imagename eq %RCKProcess%" 2>nul |find /i "%RCKProcess%">nul
If not errorlevel 1 GOTO :RockstarRunning else GOTO :StartRockstar

:StartRockstar
timeout /t 8 > nul 
start "Rockstar" "%RockstarPath%"
echo %Rockst%
GOTO :Discord


:RockstarRunning

echo %Rockrn%
::--------------------- DISCORD -------------------
:Discord
SET DiscordPath=%USERPROFILE%\Desktop\Discord.lnk
Set "DSCDProcess=Discord.exe"
tasklist /NH /FI "imagename eq %DSCDProcess%" 2>nul |find /i "%DSCDProcess%">nul
If not errorlevel 1 GOTO :DiscordRunning else GOTO :StartDiscord

:StartDiscord
timeout /t 3 > nul
start "Discord" "%DiscordPath%" 
echo %Discordst%
GOTO :Steam
:DiscordRunning
echo %Discordrn%

::--------------------- STEAM -------------------------
:Steam
SET SteamPath=C:\Users\Public\Desktop\Steam.lnk
Set "STMProcess=Steam.exe"
tasklist /NH /FI "imagename eq %STMProcess%" 2>nul |find /i "%STMProcess%">nul
If not errorlevel 1 GOTO :SteamRunning else GOTO :StartSteam


:StartSteam
timeout /t 3 > nul
start "Steam" "%SteamPath%" -nochatui -nofriendsui -silent
echo %Steamst%
GOTO :Teamspeak

:SteamRunning
echo %Steamrn%

::------------------ TEAMSPEAK ------------------------
:Teamspeak

SET TeamspeakPath=C:\Users\Public\Desktop\TeamSpeak 3 Client.lnk
Set "TSProcess=ts3client_win64.exe"
tasklist /NH /FI "imagename eq %TSProcess%" 2>nul |find /i "%TSProcess%">nul
If not errorlevel 1 GOTO :TeamspeakRunning else GOTO :StartTeamspeak


:StartTeamspeak

start "Teamspeak" "%TeamspeakPath%"
echo %Teamspeakst%
timeout /t 3 > nul
GOTO :RedM

:TeamspeakRunning
echo %Teamspeakrn%

::------------------ REDM ------------------------------------
:RedM
SET RedMPath=%USERPROFILE%\Desktop\RedM.lnk
Set "RDMProcess=RedM.exe"
echo:
echo RedM is ready to run, press any key to proceed
echo:
pause
tasklist /NH /FI "imagename eq %RDMProcess%" 2>nul |find /i "%RDMProcess%">nul
If not errorlevel 1 GOTO :RedMRunning else GOTO :RedMStart
::RedMStart
start "RedM" "%RedMPath%" +connect play.ranchroleplay.com
echo %RedMst%
timeout /t 5 > nul
GOTO :LOOP
:RedMRunning
echo  %RedMrn%
GOTO :LOOP
:: We need a loop so that if the RedM crashes or the server restarts we don't have to run
:: the whole .bat file one more time. Just to make it different we do the same thing check
:: if running move on otherwise start it and move on

:LOOP
cls
color 2
echo:
echo:
echo             --------------------------------
echo             RedM Ranchroleplay Launcher 0.9
echo                    Made by Who_Cares
echo                   -- Beta Version --
echo             --------------------------------
echo       This is not an official Ranchroleplay Product
echo:
echo:
echo "to re-start RedM just press a button"
pause
GOTO :StartOver
:Exit
eof