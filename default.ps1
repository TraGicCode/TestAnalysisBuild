. .\scripts\Find-MSBuild.ps1

Properties {
    $BuildRoot = Resolve-Path .
    $Solution = "$BuildRoot\TestAnalysisBuild.sln"
    $NugetExe = "$BuildRoot\.nuget\NuGet.exe"
    $NugetPackagesDirectory = "$BuildRoot\packages"
    $MSBuildExe = Find-MSBuild -Version "16.0"
}

# ========================================================================================
# Synopsis: Restores Nuget Packages for solution
#=================================================================================================
Task Restore-NugetPackages {
    Exec { & $NugetExe restore $Solution -packagesDirectory $NugetPackagesDirectory }
}


#=================================================================================================
# Synopsis: Incremental Solution Build
#=================================================================================================
Task Compile-Solution  {
    # Ensure Buildlog folder exists

    Exec { & $MSBuildExe $Solution /p:Configuration=Release /nodeReuse:false }
}





Task default -Depends Restore-NugetPackages, Compile-Solution