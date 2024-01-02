@echo off
setlocal enabledelayedexpansion

set /p "input_folder=Podaj sciezke do folderu z plikami AVI: "
set "output_folder=%input_folder%converted"

if not exist "%output_folder%" mkdir "%output_folder%"

for %%i in ("%input_folder%\*.avi") do (
    set "input_file=%%i"
    set "output_file=%output_folder%\!input_file:%input_folder%\=!"
    set "output_file=!output_file:.avi=.mp4!"
      
    ffmpeg -i "!input_file!" "!output_file!"
    
    echo Konwersja !input_file! zakonczona.
)
pause
endlocal