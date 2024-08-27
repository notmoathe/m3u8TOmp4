# M3U8 to MP4 Converter

This batch script converts M3U8 streams to MP4 using FFmpeg.

## Features
- Checks if FFmpeg is installed.
- Prompts user to download FFmpeg if not found.
- Converts M3U8 link to MP4.
- Saves output to the Downloads folder by default, with an option to choose a different directory.

## Usage

1. **Download FFmpeg** (if not installed):
   - Download from [FFmpeg Builds](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z).
   - Extract the downloaded archive.
   - Move the entire `bin` folder (with `ffmpeg.exe`, `ffplay.exe`, `ffprobe.exe` inside) to your main drive, for example, `C:\bin`.
   - Add `C:\bin` to your system's PATH.

2. **Run the Script**:
   - Double-click `convert-m3u8-to-mp4.bat`.
   - Enter the M3U8 link and output file name.
   - Choose the output directory (or press Enter to save in Downloads).

3. **Conversion**:
   - The script will convert the M3U8 stream to an MP4 file in the specified directory.

## License
This script is free to use.
