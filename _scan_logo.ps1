param()
Add-Type -AssemblyName System.Drawing
$path = 'C:\PROYECTOS\ABELITO TECH\assets\logo-abelito-tech.png'
$bmp = New-Object System.Drawing.Bitmap($path)
$rows = @()
for ($y = 0; $y -lt $bmp.Height; $y += 20) {
  $nonWhite = 0
  for ($x = 0; $x -lt $bmp.Width; $x += 1) {
    $p = $bmp.GetPixel($x, $y)
    if ($p.R -lt 235 -or $p.G -lt 235 -or $p.B -lt 235) { $nonWhite++ }
  }
  $rows += ("y={0} nonWhite={1}" -f $y, $nonWhite)
}
$rows -join [Environment]::NewLine
$bmp.Dispose()
