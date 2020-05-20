##已知文件的路径，获取该文件所在的目录
$SourceFilaPath = "$env:USERPROFILE\Desktop\VNC-Viewer-6.18.907-Windows-64bit.exe"
$FileInfo = [System.IO.FileInfo]$SourceFilaPath
##打印目录
Write-Host ($FileInfo.DirectoryName)
##打印该文件名,带后缀
Write-Host ($FileInfo.Name)
##打印该文件名,不带后缀
Write-Host ($FileInfo.BaseName)
##修改文件后缀
write-host ([io.path]::Combine($FileInfo.DirectoryName, $file.BaseName) + '.png')
