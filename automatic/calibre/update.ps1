Import-Module AU

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri "https://github.com/kovidgoyal/calibre/releases"

    $re32  = "calibre-\d+.\d+.\d+.*msi"
    $url32 = "https://github.com" + ($download_page.Links | Where-Object href -match $re32 | Select-Object -First 1 -expand href)

    $re64 = "calibre-64bit-\d+.\d+.\d+.*msi"
    $url64 = "https://github.com" + ($download_page.Links | Where-Object href -match $re64 | Select-Object -First 1 -expand href)

    $version = ($url32 | Select-String -Pattern "[0-9]+\.[0-9]+\.[0-9]+").Matches[0].ToString()

    return @{
        URL32        = $url32
        URL64        = $url64
        Version      = $version
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
             "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
             "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
             "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
             "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}
 
Update-Package
