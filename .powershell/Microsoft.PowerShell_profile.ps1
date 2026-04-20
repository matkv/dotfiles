$env:POWERSHELL_UPDATECHECK = 'Off'

fastfetch

Set-Alias z zellij.exe

function appdata {
    Set-Location $env:APPDATA
}

function dotfiles {
    Set-Location $env:USERPROFILE\Documents\Code\dotfiles
}

function dev {
    Set-Location $env:USERPROFILE\Documents\Code
}

$CustomAliases = @(
    [PSCustomObject]@{ Name = "dev";      Description = "cd to $env:USERPROFILE\Documents\Code" }
    [PSCustomObject]@{ Name = "appdata";  Description = "cd to $env:APPDATA" }
    [PSCustomObject]@{ Name = "dotfiles"; Description = "cd to $env:USERPROFILE\Documents\Code\dotfiles" }
    [PSCustomObject]@{ Name = "z";        Description = "Launch Zellij" }
)

Write-Host "Aliases" -ForegroundColor Cyan
$CustomAliases | Format-Table -AutoSize
