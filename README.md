# MP3 Album Artwork Extractor

This project is a simple PowerShell script to extract embedded album artwork from `.mp3` files and save them as `.jpg` images.

## 📂 Features
- Select a target folder containing MP3 files via a folder picker dialog.
- Automatically extracts album artwork embedded in ID3 tags.
- Saves extracted images as JPG files, named after the original MP3 filename.
- Supports multiple artworks per file (if any).

## ⚙️ Requirements
- **PowerShell** (tested on Windows PowerShell 5.1 and PowerShell 7)
- **TagLibSharp.dll** (TagLib#)

## 📥 About TagLibSharp
This script uses **TagLib# (TagLibSharp.dll)** to read ID3 tags and extract images.

**TagLib# is licensed under LGPL v2.1**, which allows redistribution under certain conditions:
- Include or link to the source code (e.g., https://github.com/mono/taglib-sharp)
- Include the LGPL v2.1 license text.

You can download TagLib# from:
- [NuGet Gallery (TagLibSharp)](https://www.nuget.org/packages/TagLibSharp/)
- [GitHub Repository (mono/taglib-sharp)](https://github.com/mono/taglib-sharp)

After downloading, extract `TagLibSharp.dll` from the package (`.nupkg` file) and place it in the same folder as this script.

## 🚀 How to Use
1. Place `mp3artworksaver.ps1` and `TagLibSharp.dll` in the same directory.
2. Run the PowerShell script:
    ```powershell
    powershell -ExecutionPolicy Bypass -File ".\mp3artworksaver.ps1"
    ```
3. Select the folder containing your MP3 files.
4. The extracted album artworks will be saved as JPG files in the same folder.

## 📝 Notes
- If a file contains multiple embedded images, the images will be saved with index numbers like `_art0`, `_art1`, etc.
- If an MP3 file does not contain any artwork, the script will display "No album art found".

## 📜 License
This script is provided under the MIT License.

Note: TagLib# follows the LGPL v2.1 license separately.
