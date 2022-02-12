$ErrorActionPreference = 'Stop';

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	softwareName   = "gping"
	url64bit       = "https://github.com/orf/gping/releases/download/gping-v1.2.7/gping-Windows-x86_64.zip";
	checksum64     = "92d0ebb50cbebb0b187e1d4ceba054813ca4e2825ad2db3e6633b6c60a51d8fe";
	checksumType64 = "sha256";
}

Install-ChocolateyZipPackage @packageArgs
