@echo off
cd %homedrive%%homepath%
title 
if exist %temp%\bruh exit
set /P a=It's time to be a 
if /I "%a%" equ "big shot" goto run
exit

:run
if exist %temp%\bruh exit
echo 1 > %temp%\bruh
if exist start.vbs del start.vbs
if exist launch.bat del launch.bat
curl \ -H "Accept: application/vnd.github.v3+json" \ https://api.github.com/repos/Zerovaskr/bigshot/releases/latest > %temp%\cry
type %temp%\cry | findstr https://github.com/Zerovaskr/bigshot/releases/tag > %temp%\cry2
for /f "delims=," %%i in ('type %temp%\cry2') do set text=%%i
set tag=%text:~65,-1%

echo dim wshshell >> start.vbs
echo set wshshell = wscript.createobject("wscript.shell") >> start.vbs
echo wshshell.run "%homedrive%%homepath%\launch.bat", 0 >> start.vbs

echo cd %homedrive%%homepath% >> launch.bat
echo powershell Invoke-WebRequest -uri "https://github.com/Zerovaskr/bigshot/archive/refs/tags/%tag%.zip" -outfile %temp%\bigshot.zip >> launch.bat
echo powershell Expand-Archive -path %temp%\bigshot.zip -DestinationPath %homedrive%%homepath% -force >> launch.bat
echo rename bigshot-%tag% bigshot >> launch.bat
echo move bigshot\finish.bat %homedrive%%homepath% >> launch.bat
echo move bigshot\kicker.vbs %homedrive%%homepath% >> launch.bat
echo timeout /nobreak /t 5 >> launch.bat
echo md bigshot\running >> launch.bat
echo start bigshot\kickoff.vbs >> launch.bat
echo del start.vbs >> launch.bat
echo del %temp%\bigshot.zip >> launch.bat
echo del launch.bat >> launch.bat

del %temp%\cry
del %temp%\cry2
start start.vbs