echo "Anti-AntiFooling v0.1"
echo "Created by SadFud"
$vbox = Get-Process VBoxService -ErrorAction SilentlyContinue
$vmware = Get-Process VMwareUser -ErrorAction SilentlyContinue
if ($vbox -Or $vmware){
    if ($vbox){
        Copy-Item C:\Windows\System32\VBoxTray.exe C:\antifooling\detectado.exe
    } ElseIf ($vmware){
        Copy-Item C:\Program Files\VMWare\VMware Workstation\VMwareTray.exe C:\antifooling\detectado.exe
    }
    cd C:\
cd antifooling
C:\antifooling\iconsext.exe /save "detectado.exe" "C:\antifooling" -icons
Start-Sleep -s 2
$someFilePath = "C:\antifooling\csilogfile_99.ico"
$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($someFilePath)))
if($hash -eq "46-4C-AD-85-0D-AD-4B-07-25-78-08-D5-84-B0-D0-D1"){
echo "Tecnica Antifooling detectada"
} else {
echo "Tecnica AntiFooling no detectada"
}
} else {
echo "Tecnica AntiFooling no detectada"
}
