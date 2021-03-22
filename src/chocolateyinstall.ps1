$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	softwareName   = "gping"
	url64bit       = "https://github.com/orf/gping/releases/download/v1.2.1/gping-Windows-x86_64.zip";
	checksum64     = "377D648F054A23426D5789A93B2B898ADFA25DA0C52B976A7C1606C9CDF3C8B1";
	checksumType64 = "sha256";
}

Install-ChocolateyZipPackage @packageArgs
