# script variables
$regionalsettingsURL = ""
$RegionalSettings = "D:\VMLocale.xml"

# download settings
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)

# set region and language settings
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# set region and language for current user
Set-WinSystemLocale en-GB
Set-WinUserLanguageList -LanguageList en-GB -Force
Set-Culture -CultureInfo en-GB
Set-WinHomeLocation -GeoId 242

# set timezone
Set-TimeZone -Name "GMT Standard Time"

# wait 60s, cleanup downloaded file and restart to apply changes
Start-Sleep -S 60
Remove-Item -Path $RegionalSettings
Restart-Computer