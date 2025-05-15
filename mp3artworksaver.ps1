# Select target folder
Add-Type -AssemblyName System.Windows.Forms
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select the folder containing MP3 files."
if ($folderBrowser.ShowDialog() -ne "OK") { exit }
$targetFolder = $folderBrowser.SelectedPath

# Select output folder for album art
$saveFolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$saveFolderBrowser.Description = "Select the folder to save album art images."
if ($saveFolderBrowser.ShowDialog() -ne "OK") { exit }
$outputFolder = $saveFolderBrowser.SelectedPath

# Load TagLibSharp
try {
    Add-Type -Path "TagLibSharp.dll"
} catch {
    Write-Host "TagLibSharp.dll is missing. Please place it in the same folder as this script."
    exit
}

# Get all MP3 files
$mp3Files = Get-ChildItem -Path $targetFolder -Filter *.mp3

# アルバム名ごとに保存済みかどうかを記録するハッシュテーブル
$albumSaved = @{}

foreach ($file in $mp3Files) {
    $mp3 = [TagLib.File]::Create($file.FullName)
    $album = $mp3.Tag.Album

    if ([string]::IsNullOrWhiteSpace($album)) {
        $album = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    }

    # ファイル名に使えない文字を置換
    $safeAlbum = $album -replace '[\\\/:\*\?"<>\|]', '_'

    if ($mp3.Tag.Pictures.Count -gt 0 -and -not $albumSaved.ContainsKey($safeAlbum)) {
        # 最初の画像のみ保存
        $pic = $mp3.Tag.Pictures[0]
        $outputFileName = "${safeAlbum}_artwork.jpg"
        $outputPath = Join-Path -Path $outputFolder -ChildPath $outputFileName

        [System.IO.File]::WriteAllBytes($outputPath, $pic.Data.Data)
        Write-Host "Extracted: $outputPath"
        $albumSaved[$safeAlbum] = $true
    } elseif ($mp3.Tag.Pictures.Count -eq 0) {
        Write-Host "No album art found: $($file.Name)"
    }
}

