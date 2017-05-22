$LocalPath = ".\build"
 
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
 
$Fontdir = Get-ChildItem $LocalPath | Where-Object {$_.Extension -EQ ".ttf"}

Write-Output "Installing awesome-terminal-fonts"
foreach($File in $Fontdir) 
{
    [Console]::Write("Installing $File.Name...")
    $objFolder.CopyHere($File.fullname, 0x10)
    Write-Output " installed."
}