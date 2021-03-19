$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	softwareName   = "gping"
	url64bit       = "https://github.com/orf/gping/releases/download/v1.0.1/gping-Windows-x86_64.zip";
	checksum64     = "824FE3BA3A800F38A8D20BEB0BB4F0CE46FEA957D4501750AA2F9E7CF015BC86";
	checksumType64 = "sha256";
}

Install-ChocolateyZipPackage @packageArgs
