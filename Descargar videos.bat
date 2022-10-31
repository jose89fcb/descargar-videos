@echo off
: Top
: Menu
Cls
title Descarga de Videos  %time%   //   %date%
set ESC=
set Green=%ESC%[1;32m
set Red=%ESC%[31m
set Blue=%ESC%[34m
set Magenta=%ESC%[1;35m
set Yellow=%ESC%[33m
set Black=%ESC%[1;30m
set Cyan=%ESC%[36m
set White=%ESC%[1;37m
echo                           %green%---------------------------------
echo                           %white%Esta aplicacion descarga los videos
echo.
echo.
echo.
echo.                            %white%-AtresPlayer.com
echo                             %Red%-Mitele.es
echo                             %Magenta%-Youtube.com
echo                             %Blue%-rtve.es
echo                             %cyan%-Twitter.com(Videos/Gif)
echo.                            %Yellow%-Vimeo.com
echo. %white%
echo.
echo.
echo                               Tambien descarga los links con extension .mpd y .m3u8
echo                           %green%---------------------------------
echo.
echo.
echo                         %green%--------------------
echo                        %black%Sigueme en twitter.com/Jose89FCB
echo.                       %green% --------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
SET /p              rutaa=%magenta%Pega La url del video:%white%
ECHO.
ECHO.
ECHO.
ECHO %red%Quieres cambiar el nombre del archivo?:%white%
echo.
ECHO %black%1.Si
ECHO %black%2.No
SET /P cnl=%yellow%Escribe una de las dos opciones:%white%
if %cnl%== 1  goto rn1
if %cnl%== 2  goto rn2
: rn1
ECHO.
ECHO.
ECHO.
SET /P fln=%green%Escribe el nombre del archivo sin extension:%white%
GoTo frmt
: rn2
ECHO.
ECHO.
ECHO.
ECHO.
SET fln=%%(title)s
GoTo frmt
: frmt
ECHO.
ECHO.
ECHO.
ECHO %cyan%Ya casi estas
echo. %red%
pause
: opr
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
SET /P operation=%blue%Escribe 1 para avanzar:%white%
if %operation%== 1  goto op1
exit
: Video
youtube-dl -i --recode-video %frmt% -o ./Video/%fln%.%%(ext)s --hls-prefer-native %rutaa%
echo.
echo Abre la carpeta Video, alli tienes descargado el video en formato %frmt%
echo.
echo Disfruta :)
ECHO.
pause
EXIT
goto top
:op1
ECHO.
ECHO.
echo %magenta%Estos son los formatos de Audio/Video:
echo. %white%
echo     %yellow%Audio: mp3, wav y aac
echo.
echo    Video:  mkv, avi, mp4, webm y flv
ECHO.
SET /P frmt=%green%Escribe el formato que quieras descargar:%white%
ECHO %cyan%Descargando %frmt%...
echo. %white%
if %frmt%==aac goto :audio
if %frmt%==mp3 goto :audio
if %frmt%==wav goto :audio
if %frmt%==mkv goto :video
if %frmt%==avi goto :video
if %frmt%==mp4 goto :video
if %frmt%==webm goto :video
if %frmt%==flv goto :video
exit
: audio
youtube-dl -i %rutaa% --extract-audio --audio-format  %frmt% -o ./Audio/%fln%.%%(ext)s
echo.
echo Abre la carpeta Audio, alli tienes descargado el audio en formato %frmt%
echo.
echo Disfruta :)
echo.
echo Press any key to exit...
pause >nul
erase %temp%\AudioVideo.bat