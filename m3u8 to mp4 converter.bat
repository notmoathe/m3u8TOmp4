@echo off
setlocal

:: Check if FFmpeg is installed
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo FFmpeg not found.
    echo Please download FFmpeg from the following link:
    echo https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z
    echo.
    echo Instructions:
    echo 1. Download the archive and extract it.
    echo 2. Move the contents of the "bin" folder (ffmpeg.exe, ffplay.exe, ffprobe.exe) to a directory, for example, C:\ffmpeg\bin.
    echo 3. Add C:\ffmpeg\bin to your system's PATH environment variable.
    echo.
    echo To add FFmpeg to your PATH environment variable:
    echo 1. Open the Start Menu and search for "Environment Variables" and click "Edit the system environment variables".
    echo 2. In the System Properties window, click the "Environment Variables" button.
    echo 3. Under "System variables", find the "Path" variable, select it, and click "Edit".
    echo 4. In the Edit Environment Variable window, click "New" and add the path to your FFmpeg bin directory, for example, C:\ffmpeg\bin.
    echo 5. Click "OK" to close all windows.
    echo 6. Close and reopen any command prompts or terminals for the changes to take effect.
    echo 7. After completing these steps, run this script again.
    pause
    exit /b
) else (
    echo FFmpeg is already installed.
)

:: Prompt user for M3U8 link
set /p "m3u8_link=Enter the M3U8 link: "

:: Prompt user for output file name
set /p "output_file=Enter the output file name (e.g., output.mp4): "

:: Prompt user for output directory with default to Downloads folder
set "default_dir=%USERPROFILE%\Downloads"
set /p "output_dir=Enter the output directory [Press Enter for Downloads folder]: " 
if "%output_dir%"=="" set "output_dir=%default_dir%"

:: Ensure the directory exists
if not exist "%output_dir%" (
    echo The directory "%output_dir%" does not exist.
    echo Creating the directory...
    mkdir "%output_dir%"
)

:: Run FFmpeg command
ffmpeg -protocol_whitelist "file,crypto,http,https,tcp,tls" -i "%m3u8_link%" -c copy -bsf:a aac_adtstoasc -y "%output_dir%\%output_file%"

echo Conversion completed. The output file is saved as "%output_dir%\%output_file%".
pause
