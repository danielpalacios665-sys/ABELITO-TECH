param()
Add-Type -AssemblyName System.Drawing
$path = 'C:\PROYECTOS\ABELITO TECH\assets\logo-abelito-tech.png'
$bmp = New-Object System.Drawing.Bitmap($path)
$minX = $bmp.Width; $maxX = 0
for ($y = 110; $y -le 630; $y++) {
  for ($x = 0; $x -lt $bmp.Width; $x++) {
    $p = $bmp.GetPixel($x, $y)
    if ($p.R -lt 235 -or $p.G -lt 235 -or $p.B -lt 235) {
      if ($x -lt $minX) { $minX = $x }
      if ($x -gt $maxX) { $maxX = $x }
    }
  }
}
Write-Output ("minX={0} maxX={1} width={2}" -f $minX, $maxX, ($maxX - $minX + 1))
$bmp.Dispose()
