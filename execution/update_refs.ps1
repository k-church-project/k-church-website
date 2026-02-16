$docsDir = "x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs"
$target = "images/church-logo.jpeg"
$replacement = "images/church-logo.png"

Get-ChildItem -Path $docsDir -Filter "*.html" | ForEach-Object {
    $content = Get-Content $_.FullName
    if ($content -match $target) {
        $content = $content -replace $target, $replacement
        Set-Content -Path $_.FullName -Value $content
        Write-Host "Updated $($_.Name)"
    }
    else {
        Write-Host "No changes needed for $($_.Name)"
    }
}
