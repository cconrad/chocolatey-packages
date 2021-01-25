$ErrorActionPreference = 'Stop';

[string]$qus = (Get-UninstallRegistryKey -SoftwareName "Mudlet*").QuietUninstallString

Invoke-Expression $qus.Replace('"', '')
