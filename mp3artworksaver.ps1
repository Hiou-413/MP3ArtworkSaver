# Select target folder
Add-Type -AssemblyName System.Windows.Forms
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select the folder containing MP3 files."
if ($folderBrowser.ShowDialog() -ne "OK") { exit }
$targetFolder = $folderBrowser.SelectedPath

# Load TagLibSharp
try {
    Add-Type -Path "TagLibSharp.dll"
} catch {
    Write-Host "TagLibSharp.dll is missing. Please place it in the same folder as this script."
    exit
}

# Get all MP3 files
$mp3Files = Get-ChildItem -Path $targetFolder -Filter *.mp3

foreach ($file in $mp3Files) {
    $mp3 = [TagLib.File]::Create($file.FullName)

    if ($mp3.Tag.Pictures.Count -gt 0) {
        $index = 0
        foreach ($pic in $mp3.Tag.Pictures) {
            $outputName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
            $outputPath = Join-Path $targetFolder "$outputName" + "_art$index.jpg"

            [System.IO.File]::WriteAllBytes($outputPath, $pic.Data.Data)
            Write-Host "Extracted: $outputPath"
            $index++
        }
    } else {
        Write-Host "No album art found: $($file.Name)"
    }
}
