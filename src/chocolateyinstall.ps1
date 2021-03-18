$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	softwareName   = "gping"
	url64bit       = "https://github.com/orf/gping/releases/download/v1.0.0/gping-Windows-x86_64.zip";
	checksum64     = "487BF24A17569E2E0FD3430033AAA8E108E98F789F14F9B10C9FBB0022BAC1F8";
	checksumType64 = "sha256";
}

Install-ChocolateyZipPackage @packageArgs
