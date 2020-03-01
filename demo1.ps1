#Requires -Version 7

# SETUP
$ErrorView = 'NormalView'
Get-ExperimentalFeature | Disable-ExperimentalFeature


# Group Policy
InstallPSCorePolicyDefinitions.ps1





# ForEach-Object -Parallel

Measure-Command {

    Get-ChildItem c:\dev\git |
    ForEach-Object {

        for ($i = 0; $i -lt 100000; $i++) {
            $j += 1
        }
    }
}

##
# -split 

"a b c d" -split " "
"a b c d" -split " ", 2
"a b c d" -split " ", -2

# Select-String emphasis
Get-ChildItem C:\dev\git\au-packages -Recurse *.nuspec | Select-String title

Get-ChildItem C:\dev\git\au-packages -Recurse *.nuspec | Select-String title -NoEmphasis

# Select-String -Raw
Get-ChildItem C:\dev\git\au-packages -Recurse *.nuspec | Select-String title -Raw

# Select-String -Culture
Get-ChildItem C:\dev\git\au-packages -Recurse *.nuspec | Select-String -SimpleMatch title -Culture zh-CN

# ActionPreference.Break

$ErrorActionPreference = "Break"
Write-Host "1"
Write-Verbose "Verbose"
Write-Error "Oh dear"

# Get-Error
throw "oh dear"
Get-Error

# Ternary operator
$answer = [Datetime]::Now.Minute -gt 30 ? "minutes to" : "minutes past"

# Pipeline chain
(ping -x) && (ping localhost)
(ping -x) || (ping localhost)

# Null coalescing

$a = "a value"
$a ?? "fallback value"
$a = $null
$a ?? "fallback value"

$a ??= "fallback value"

# Null conditional
$f = (Get-Item .\demo1.ps1)
$f.Directory.Name
$f = (Get-Item demo2.ps1 -ErrorAction Ignore)
$f?.Directory?.Name

# Experimental features
Get-ExperimentalFeature
Enable-ExperimentalFeature -Name PSNullConditionalOperators

# Tab completion for enums and validateset
[System.Drawing.KnownColor] $c
$ErrorActionPreference

# ConvertFrom-SecureString -AsPlainText
$cred = Get-Credential
$cred.Password

ConvertFrom-SecureString -AsPlainText -SecureString $cred.Password

# $ErrorView
$i = 0
$i.ToString2()

# Update-List
$a = [PSCustomObject]@{
    Name = 'Test';
    List = [System.Collections.ArrayList]::new( @("a", "b", "c"))
}

$a | Update-List -Property List -Add "d"

# Get-Hotfix (missing in Core 6)
Get-HotFix

# Out-Gridview (missing in Core 6)
Get-ChildItem .. | Out-GridView

# Clear-RecycleBin
Clear-RecycleBin