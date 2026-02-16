Add-Type -AssemblyName System.Drawing

$sourcePath = "x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.jpeg"
$destPath = "x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.png"

try {
    $img = [System.Drawing.Bitmap]::FromFile($sourcePath)
    $newImg = New-Object System.Drawing.Bitmap($img.Width, $img.Height)
    $g = [System.Drawing.Graphics]::FromImage($newImg)
    
    # Create attributes to treat white as transparent
    $attr = New-Object System.Drawing.Imaging.ImageAttributes
    $attr.SetColorKey([System.Drawing.Color]::FromArgb(200, 200, 200), [System.Drawing.Color]::White)
    
    $rect = New-Object System.Drawing.Rectangle(0, 0, $img.Width, $img.Height)
    $g.DrawImage($img, $rect, 0, 0, $img.Width, $img.Height, [System.Drawing.GraphicsUnit]::Pixel, $attr)
    
    $newImg.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $g.Dispose()
    $newImg.Dispose()
    $img.Dispose()
    
    Write-Host "Success: Converted $sourcePath to $destPath"
} catch {
    Write-Error "Failed to convert image: $_"
}
