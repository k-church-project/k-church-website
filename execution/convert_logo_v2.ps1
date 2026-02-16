Add-Type -AssemblyName System.Drawing

$sourcePath = "x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.jpeg"
$destPath = "x:\assorted\obsidian\assorted\links\tasks\(main)(website) k-church-project\docs\images\church-logo.png"

try {
    # Load source image
    $srcImg = [System.Drawing.Bitmap]::FromFile($sourcePath)
    
    # Create destination image with ARGB format
    $destImg = New-Object System.Drawing.Bitmap($srcImg.Width, $srcImg.Height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    
    # Iterate through all pixels
    for ($x = 0; $x -lt $srcImg.Width; $x++) {
        for ($y = 0; $y -lt $srcImg.Height; $y++) {
            $pixel = $srcImg.GetPixel($x, $y)
            
            # Check if pixel is near white (Threshold: 220)
            if ($pixel.R -gt 220 -and $pixel.G -gt 220 -and $pixel.B -gt 220) {
                # Make transparent
                $destImg.SetPixel($x, $y, [System.Drawing.Color]::Transparent)
            }
            else {
                # Keep original color
                $destImg.SetPixel($x, $y, $pixel)
            }
        }
    }
    
    # Save the result
    $destImg.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    # Cleanup
    $destImg.Dispose()
    $srcImg.Dispose()
    
    Write-Host "Success: Converted logo to transparent PNG at $destPath"
}
catch {
    Write-Error "Failed to process image: $_"
}
