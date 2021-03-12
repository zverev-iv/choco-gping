$ErrorActionPreference = 'Stop';

$meta = Get-Content -Path $env:ChocolateyPackageFolder\tools\packageArgs.ps1 -Raw | Out-String
$packageArgs = (Invoke-Expression $meta)

$packageArgs["packageName"] = $env:ChocolateyPackageName
$packageArgs["unzipLocation"] = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage @packageArgs
