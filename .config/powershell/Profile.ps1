#PSStyle
$PSStyle.FileInfo.Directory = "`e[34m"

# PSReadline
$PSOption = @{ 
    EditMode = 'emacs'; # Vi
    BellStyle = 'None';
    ShowToolTips = $false;
    PredictionSource = 'HistoryAndPlugin'  # History 
    # PredictionViewStyle = 'ListView';
}
Set-PSReadLineOption @PSOption

# Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key UpArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}
Set-PSReadLineKeyHandler -Key DownArrow -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
}

function setproxy{
    $env:HTTP_PROXY="127.0.0.1:10809" 
    $env:HTTPS_PROXY="127.0.0.1:10809"
    echo "set proxy done"
    showproxy
}

function setsock{
    $env:HTTP_PROXY="socks://127.0.0.1:10808"
    $env:HTTPS_PROXY="socks://127.0.0.1:10808"
}

function unsetproxy{
    $env:HTTP_PROXY=""
    $env:HTTPS_PROXY=""
    echo "unset proxy done"
}

function showproxy{
    echo "env:HTTP_PROXY = $env:HTTP_PROXY" 
    echo "env:HTTPS_PROXY = $env:HTTPS_PROXY" 
}

function ssh-copy-id([string]$userAtMachine, $args){   
    $publicKey = "$ENV:USERPROFILE" + "/.ssh/id_rsa.pub"
    if (!(Test-Path "$publicKey")){
        Write-Error "ERROR: failed to open ID file '$publicKey': No such file"            
    }
    else {
        & cat "$publicKey" | ssh $args $userAtMachine "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys || exit 1"      
        echo "ssh-copy-id success"
    }
}

function vmkill{
    taskkill /F /IM vmware.exe
    net stop vmware-view-usbd
    net stop VMwareHostd
    net stop VMAuthdService
    net stop VMUSBArbService
    taskkill /F /IM vmware-tray.exe
}


