# MP3 Album Artwork Extractor

This project is a simple tool to extract embedded album artwork from `.mp3` files and save them as `.jpg` images.

## 📂 Features
- Select a target folder containing MP3 files via a folder picker dialog.
- Select a separate output folder to save extracted album artwork images.
- Automatically extracts album artwork embedded in ID3 tags.
- **Saves only one artwork per album (by album tag), even if multiple MP3 files share the same album.**
- Extracted images are saved as JPG files, named after the album name (`AlbumName_artwork.jpg`).
- If the album tag is missing, the MP3 filename is used as the album name.

## ⚙️ Files
- `dops1.bat` : A batch file to easily run the script.
- `mp3artworksaver.ps1` : The main PowerShell script that extracts album artworks.
- `TagLibSharp.dll` : Required library to handle MP3 metadata.

## ⚙️ Requirements
- **PowerShell** (tested on Windows PowerShell 5.1 and PowerShell 7)
- **TagLibSharp.dll** (TagLib#)

## 📥 About TagLibSharp
This project uses **TagLib# (TagLibSharp.dll)** to read ID3 tags and extract images.

**TagLib# is licensed under LGPL v2.1**, which allows redistribution under certain conditions:
- Provide a link to the source code (e.g., https://github.com/mono/taglib-sharp).
- Include the LGPL v2.1 license text if distributing the DLL.

You can download TagLib# from:
- [NuGet Gallery (TagLibSharp)](https://www.nuget.org/packages/TagLibSharp/)
- [GitHub Repository (mono/taglib-sharp)](https://github.com/mono/taglib-sharp)

After downloading, extract `TagLibSharp.dll` from the package (`.nupkg` file) and place it in the same folder as the scripts.

## 🚀 How to Use
1. Place `dops1.bat`, `mp3artworksaver.ps1`, and `TagLibSharp.dll` in the same directory.
2. Double-click `dops1.bat`.
3. A folder selection dialog will appear. Choose the folder containing your MP3 files.
4. A second folder selection dialog will appear. Choose the folder where you want to save the extracted album artworks.
5. Extracted album artworks will be saved as JPG files in the output folder, named as `AlbumName_artwork.jpg`.

## 📝 Notes
- Only the first embedded image of each album (by album tag) is extracted and saved.
- If multiple MP3 files share the same album tag, the artwork is saved only once for that album.
- If the album tag is missing, the MP3 filename is used as the album name.
- If an MP3 file does not contain any artwork, the script will display "No album art found".

## 📜 License
This script (`dops1.bat` and `mp3artworksaver.ps1`) is licensed under the MIT License.

> **Important:**  
> This project uses TagLibSharp.dll, which is licensed separately under LGPL v2.1.  
> You must comply with the LGPL requirements when distributing TagLibSharp.dll.

---
