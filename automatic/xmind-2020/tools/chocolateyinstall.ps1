$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://dl3.xmind.app/Xmind-for-Windows-x64bit-24.04.10311-202405232355.exe'

  softwareName  = 'XMind 24*'

  checksum64    = '8d5efad51a0f466c63ba6901062cbe7958726b33c9c99a41e76f0c0d185b1162'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

# Move application directory
Copy-Item "$env:APPDATA\..\Local\Programs\Xmind" 'C:\Program Files\' -Recurse
Remove-Item "$env:APPDATA\..\Local\Programs\Xmind" -Recurse

# Define paths
$startMenuShortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Xmind.lnk"
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$desktopShortcutPath = "$desktopPath\Xmind.lnk"
$publicDesktopPath = [System.Environment]::GetFolderPath('CommonDesktopDirectory')

# TODO For each shortcut, set target path and start-in directory

# Move start menu shortcut
Copy-Item $startMenuShortcutPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\'
Remove-Item $startMenuShortcutPath

# Move desktop shortcut
Copy-Item $desktopShortcutPath $publicDesktopPath
Remove-Item "$desktopPath\Xmind.lnk"

# TODO Define the path to the shortcut file
$shortcutPath = "C:\path\to\your\shortcut.lnk"

# TODO Define the new target path
$newTargetPath = "C:\new\path\to\target.exe"

# TODO Define the "start in" directory
$startInPath = "C:\start\in\directory"

# TODO Create a COM object for WScript.Shell
$shell = New-Object -ComObject WScript.Shell

# TODO Create a shortcut object
$shortcut = $shell.CreateShortcut($shortcutPath)

# TODO Set the new target path
$shortcut.TargetPath = $newTargetPath

# TODO Set the "start in" directory
$shortcut.WorkingDirectory = $startInPath

# TODO Save the changes
$shortcut.Save()

# I modified the the shortcut properties, changing the target (and icon) to point to 'C:\Program Files\Xmind\Xmind.exe' and cleared the "Start in" field.