$paths = @("c:\Users\win10\Desktop\website", "c:\xampp\htdocs\wordpress")

foreach ($dir in $paths) {
    if (Test-Path $dir) {
        $htmlFiles = Get-ChildItem -Path $dir -Filter "*.html"
        foreach ($file in $htmlFiles) {
            $content = Get-Content -Path $file.FullName -Raw
            $newContent = $content -replace 'content="width=1200"', 'content="width=device-width, initial-scale=1.0"'
            if ($newContent -ne $content) {
                Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
            }
        }
    }
}
Write-Host "Viewport restored"
