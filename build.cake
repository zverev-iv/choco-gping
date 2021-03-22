var target = Argument("target", "Publish");

var packageInfo = new ChocolateyPackSettings {
    //PACKAGE SPECIFIC SECTION
    Id                       = "gping",
    Version                  = "1.2.1",
    PackageSourceUrl         = new Uri("https://github.com/zverev-iv/choco-gping"),
    Owners                   = new[] {"zverev-iv"},
    //SOFTWARE SPECIFIC SECTION
    Title                    = "gping",
    Authors                  = new[] {
        "Tom Forbes"
        },
    Copyright                = "2021 Marp Team",
    ProjectUrl               = new Uri("https://github.com/orf/gping"),
    DocsUrl                  = new Uri("https://github.com/orf/gping/blob/master/readme.md"),
    BugTrackerUrl            = new Uri("https://github.com/orf/gping/issues"),
    LicenseUrl               = new Uri("https://raw.githubusercontent.com/orf/gping/master/LICENSE"),
    RequireLicenseAcceptance = false,
    Summary                  = "Ping, but with a graph",
    Description              = "Ping, but with a graph",
    ReleaseNotes             = new [] {"https://github.com/orf/gping/releases"},
    Files                    = new [] {
        new ChocolateyNuSpecContent {Source = System.IO.Path.Combine("src", "**"), Target = "tools"}
        },
    Tags                     = new [] {
        "gping",
        "ping",
        "graph",
        "cli",
        "terminal"
        }
    };

Task("Clean")
    .Does(() =>
{
    DeleteFiles("./**/*.nupkg");
	DeleteFiles("./**/*.nuspec");
});

Task("Pack")
    .IsDependentOn("Clean")
    .Does(() =>
{
    ChocolateyPack(packageInfo);
});

Task("Publish")
    .IsDependentOn("Pack")
    .Does(() =>
{
	var publishKey = EnvironmentVariable<string>("CHOCOAPIKEY", null);
    var package = $"{packageInfo.Id}.{packageInfo.Version}.nupkg";

    ChocolateyPush(package, new ChocolateyPushSettings {
        ApiKey = publishKey
    });
});

RunTarget(target);
