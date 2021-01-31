Import-Module AU

function global:au_GetLatest {
    $url32 = (Invoke-WebRequest -Uri 'https://www.xmind.net/zen/download/win32/' -Method 'HEAD' -MaximumRedirection 0 -SkipHttpErrorCheck -ErrorAction Ignore).Headers.Location
    $url64 = (Invoke-WebRequest -Uri 'https://www.xmind.net/zen/download/win64/' -Method 'HEAD' -MaximumRedirection 0 -SkipHttpErrorCheck -ErrorAction Ignore).Headers.Location
    $version = ((Split-Path $url32 -Leaf) | Select-String -Pattern '[0-9]+\.[0-9]+\.[0-9]+').Matches[0].ToString()

    @{
        URL32   = $url32
        URL64   = $url64
        Version = $version
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
             "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
             "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
             "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
             "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}
 
Update-Package