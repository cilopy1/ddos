@echo off
color 0F

:: Display loading animation
echo Loading.
timeout /t 1
cls
echo Loading..
timeout /t 1
cls
echo Loading...
timeout /t 1
cls

:: Display title screen
echo.
echo.
color 04
echo            #############################
echo            #                            #
echo            #      CILO DDOS                #
echo            #                            #
echo            #############################
color 0C
echo.                    
echo                    made by cilo
color 0F
echo.

:: Prompt user for input
set /p discord=Do you want to get someone's IP with Discord? (y/n): 
if /i "%discord%" == "y" (
    set /p discord_id=Enter Discord ID: 
    set "discord_name="
    for /f "tokens=*" %%a in ('curl -s -X GET "https://discord.me/api/v1/users/%discord_id%" ^| jq -r ".username"') do set "discord_name=%%a"
    echo Discord Name: %discord_name%
)

set /p ip=Enter IP address: 
set /p time=Enter attack time (in seconds): 

:: Validate user input
if %time% LSS 1 (
    echo Error: Attack time must be at least 1 second.
    pause >nul
    exit
)

:: Display attack initialization message
echo.
echo Initializing  DDOS attack for %time% seconds...
timeout /t 2
cls

:: Display attack status message
echo.
echo            #############################
echo            #                            #
echo            #      CILO DDOS                 #
echo            #                            #
echo            #############################
color 0C
echo.                    
echo                    made by cilo
color 0F
echo Target IP: %ip%
echo Status: DDOS attack for %time% seconds...
timeout /t 1

:: Display rainbow attack messages
set colors=04 02 06 03 05
for %%c in (%colors%) do (
    color %%c
    echo Sending attack...
    timeout /t 1
)

:: Loop attack messages for specified time
set /a count=0
set /a max=%time%
:loop
color 0F
echo Sending attack...
timeout /t 1
set /a count+=1
if %count% LSS %max% goto loop

:: Display attack completion message
color 0F
echo attack complete!
pause >nul
exit