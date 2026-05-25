$Computer = $env:COMPUTERNAME

$OS = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsArchitecture

$CPU = Get-CimInstance Win32_Processor | Select-Object Name

$RAM = Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum

$Disk = Get-PSDrive C

Write-Host "Computer Name: $Computer"

Write-Host "`nOperating System:"
$OS

Write-Host "`nCPU:"
$CPU

Write-Host "`nRAM in GB:"
[math]::Round($RAM.Sum / 1GB, 2)

Write-Host "`nC Drive Free Space in GB:"
[math]::Round($Disk.Free / 1GB, 2)