[chocolatey/claus](https://chocolatey.org/profiles/claus)

This repository contains manual and [automatic packages](https://docs.chocolatey.org/en-us/create/automatic-packages) for [Chocolatey](https://chocolatey.org/) .

## Prerequisites

To run locally you will need:

- Powershell 5+.
- [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au): `Install-Module au` or `cinst au`.

## Create a package

To create a new package see [Creating the package updater script](https://github.com/majkinetor/au#creating-the-package-updater-script).

## Testing the package

In a package directory run: `Test-Package`. This function can be used to start testing in [chocolatey-test-environment](https://github.com/majkinetor/chocolatey-test-environment) via `Vagrant` parameter or it can test packages locally.

## Automatic package update

### Single package

Run from within the directory of the package to update that package:

```powershell
cd <package_dir>
./update.ps1
```

If this script is missing, the package is not automatic.
Set `$au_Force = $true` prior to script call to update the package even if no new version is found.

### Multiple packages
 
To update all packages run `./update_all.ps1` from the repo root. It accepts a few options:

```powershell
./update_all.ps1 -Name a*                         # Update all packages which name start with letter 'a'
./update_all.ps1 -ForcedPackages 'cpu-z copyq'    # Update all packages and force cpu-z and copyq
./update_all.ps1 -ForcedPackages 'copyq:1.2.3'    # Update all packages but force copyq with explicit version
./update_all.ps1 -ForcedPackages 'libreoffice-streams\fresh:6.1.0]'    # Update all packages but force libreoffice-streams package to update stream `fresh` with explicit version `6.1.0`.
./update_all.ps1 -Root 'c:\packages'              # Update all packages in the c:\packages folder
```

The following global variables influence the execution of `update_all.ps1` script if set prior to the call:

```powershell
$au_NoPlugins = $true        #Do not execute plugins
$au_Push      = $false       #Do not push to chocolatey
```

You can also call AU method `Update-AUPackages` (alias `updateall`) on its own in the repository root. This will just run the updater for the each package without any other option from `update_all.ps1` script. For example to force update of all packages with a single command execute:

```powershell
updateall -Options ([ordered]@{ Force = $true })
```

## Pushing updates to Chocolatey

### Authentication

In order to save your API key for https://push.chocolatey.org/, log in (or register, confirm and then log in) to https://push.chocolatey.org/, go to https://push.chocolatey.org/account, copy the API Key, and then use it in the following command:

```powershell
choco apikey -k <your key here> -s https://push.chocolatey.org/
```

### Pushing updates

```powershell
choco push [<path to nupkg>] --source https://push.chocolatey.org/
```
