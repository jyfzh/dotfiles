Import-Module -Name ps-autoenv

# starship
Invoke-Expression (&starship init powershell)

# micromamba

#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\jyf\scoop\persist\micromamba\mamba"
$Env:MAMBA_EXE = "C:\Users\jyf\scoop\apps\micromamba\current\micromamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -p $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion


# fzf
$env:FZF_DEFAULT_COMMAND="rg --files . 2> nul"
$env:FZF_DEFAULT_OPTS="--preview 'type {}'"
$env:PSFZF_EDITOR_OPTIONS="nvim"

# komorebi
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"

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
