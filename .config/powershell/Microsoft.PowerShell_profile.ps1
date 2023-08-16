Iport-Module -Name ps-autoenv

# starship
Invoke-Expression (&starship init powershell)

# fzf
$env:FZF_DEFAULT_COMMAND="rg --files . 2> nul"
$env:FZF_DEFAULT_OPTS="--preview 'type {}'"
$env:PSFZF_EDITOR_OPTIONS="nvim"

# XDG
$env:XDG_DATA_HOME="$HOME\.local\share"
$env:XDG_CONFIG_HOME="$HOME\.config"
$env:XDG_CACHE_HOME="$HOME\.cache"
$env:XDG_DATA_DIRS="$env:APPDATA"
$env:XDG_CONFIG_DIRS="$env:APPDATA"

$env:PATH+=";$HOME\.local\bin"

function pro { vim $profile }
function ll { ls.exe -al }
function rmhis { Remove-Item $env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt }
