Import-Module AU

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.mudlet.org/download/'

    $re  = '.exe'
    $url = $download_page.Links | ? href -match $re | select -First 1 -expand href

    $version = $url | Select-String -Pattern '[0-9]+\.[0-9]+\.[0-9]+'

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