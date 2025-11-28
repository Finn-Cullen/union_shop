$lines = Get-Content -Path .\coverage\lcov.info
$LF = 0
$LH = 0
foreach ($l in $lines) {
    if ($l -match '^LF:(\d+)') { $LF += [int]$matches[1] }
    elseif ($l -match '^LH:(\d+)') { $LH += [int]$matches[1] }
}
if ($LF -eq 0) { Write-Output 'No LF found' }
else { $pct = [math]::Round(($LH/$LF*100),2); Write-Output "LF=$LF LH=$LH Coverage=$pct%" }
