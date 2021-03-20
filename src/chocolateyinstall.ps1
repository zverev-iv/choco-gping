$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	softwareName   = "gping"
	url64bit       = "https://github.com/orf/gping/releases/download/v1.2.0/gping-Windows-x86_64.zip";
	checksum64     = "604CE645CD4F5D68A4B6E0423C1E5E81C7400D0C7AC85C3834A9FB2778482FC3";
	checksumType64 = "sha256";
}

Install-ChocolateyZipPackage @packageArgs
