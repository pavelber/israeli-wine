# Refreshes data/wineries-grape-man.json from grape-man.com API.
# Run from any directory; saves relative to this script's location.

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$outPath = Join-Path $PSScriptRoot "wineries-grape-man.json"

$headers = @{
    'accept'           = '*/*'
    'content-type'     = 'application/x-www-form-urlencoded; charset=UTF-8'
    'origin'           = 'https://grape-man.com'
    'referer'          = 'https://grape-man.com/%D7%99%D7%A7%D7%91%D7%99-%D7%99%D7%A9%D7%A8%D7%90%D7%9C/'
    'x-requested-with' = 'XMLHttpRequest'
    'user-agent'       = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
}

function Invoke-WineryQuery($extrawhereEncoded) {
    $body = "tags=%5B%5D&tpl=minipage-single-for-imgindex&start=0&parents=46&limit=500&extrawhere=$extrawhereEncoded"
    $r = Invoke-WebRequest -Uri 'https://grape-man.com/showarticlesbytags.html' -Method POST -Headers $headers -Body $body -UseBasicParsing
    $content = [System.Text.Encoding]::UTF8.GetString($r.RawContentStream.ToArray())
    $parts = $content -split '(?=<div class="mini-page-port-auto txt33 slice">)'
    $results = @()
    foreach ($part in $parts) {
        $nameMatch = [regex]::Match($part, 'mini-page-title[^>]*>\s*(.+?)\s*</div>')
        $hrefMatch = [regex]::Match($part, '<a href="([^"]+)"')
        $imgMatch  = [regex]::Match($part, 'background: url\(([^)]+)\)')
        if ($nameMatch.Success -and $hrefMatch.Success) {
            $results += [PSCustomObject]@{
                name = $nameMatch.Groups[1].Value.Trim()
                url  = "https://grape-man.com/" + $hrefMatch.Groups[1].Value.Trim()
                logo = if ($imgMatch.Success) { "https://grape-man.com" + $imgMatch.Groups[1].Value.Trim() } else { "" }
            }
        }
    }
    return $results
}

Write-Host "Fetching all wineries..."
$all = Invoke-WineryQuery '%7B%7D'
Write-Host "Total: $($all.Count)"

$regionQueries = @{
    'Golan Heights'   = '%7B%22yekev_area_select%22%3A%22%D7%A8%D7%9E%D7%AA+%D7%94%D7%92%D7%95%D7%9C%D7%9F%22%7D'
    'Galilee'         = '%7B%22yekev_area_select%22%3A%22%D7%92%D7%9C%D7%99%D7%9C+%D7%95%D7%94%D7%A2%D7%9E%D7%A7%D7%99%D7%9D%22%7D'
    'Carmel'          = '%7B%22yekev_area_select%22%3A%22%D7%9B%D7%A8%D7%9E%D7%9C+%D7%95%D7%9E%D7%99%D7%A9%D7%95%D7%A8+%D7%94%D7%97%D7%95%D7%A3%22%7D'
    'Judean Hills'    = '%7B%22yekev_area_select%22%3A%22%D7%99%D7%95%D7%90%D7%91+%D7%99%D7%94%D7%95%D7%93%D7%94%22%7D'
    'Judea & Samaria' = '%7B%22yekev_area_select%22%3A%22%D7%99%D7%94%D7%95%D7%93%D7%94+%D7%95%D7%A9%D7%95%D7%9E%D7%A8%D7%95%D7%9F%22%7D'
    'Negev'           = '%7B%22yekev_area_select%22%3A%22%D7%A0%D7%92%D7%91+%D7%95%D7%94%D7%A2%D7%A8%D7%91%D7%94%22%7D'
}

$regionSets = @{}
foreach ($regionName in $regionQueries.Keys) {
    Write-Host "Fetching $regionName..."
    $regionSets[$regionName] = (Invoke-WineryQuery $regionQueries[$regionName]) | ForEach-Object { $_.name }
}

Write-Host "Fetching kosher list..."
$kosherNames = (Invoke-WineryQuery '%7B%22kosher%22%3A%22%D7%9B%D7%9F%22%7D') | ForEach-Object { $_.name }
Write-Host "Kosher count: $($kosherNames.Count)"

$enriched = $all | ForEach-Object {
    $name = $_.name
    $region = "Unknown"
    foreach ($r in $regionSets.Keys) {
        if ($regionSets[$r] -contains $name) { $region = $r; break }
    }
    [PSCustomObject]@{
        name   = $name
        url    = $_.url
        logo   = $_.logo
        region = $region
        kosher = $kosherNames -contains $name
        active = -not ($name -like "*לא פעיל*")
    }
}

$output = [PSCustomObject]@{
    fetched_at = (Get-Date -Format "yyyy-MM-dd")
    count      = $enriched.Count
    wineries   = $enriched
}

$json = $output | ConvertTo-Json -Depth 4
[System.IO.File]::WriteAllText($outPath, $json, [System.Text.Encoding]::UTF8)
Write-Host "Saved $($enriched.Count) wineries to $outPath"
