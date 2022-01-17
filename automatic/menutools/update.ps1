Import-Module AU

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri "https://github.com/navossoc/MenuTools/releases"

    $re  = ".exe"
    $url = "https://github.com" + ($download_page.Links | Where-Object href -match $re | Select-Object -First 1 -expand href)

    $version = ($url | Select-String -Pattern "[0-9]+\.[0-9]+\.[0-9]+").Matches[0].ToString()

    return @{
        URL32        = $url
        Version      = $version
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
             "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
             "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}
 
Update-Package