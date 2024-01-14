#Setup
cls
$stopWatch= [System.Diagnostics.Stopwatch]::StartNew()
$db = "tcp:datcare.database.windows.net"
$dbId = "planetgeni"
$pwd = "U534?576?~4JD8w"
$stopWatch.Start()
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
Write-host "My Db is " $db 
Push-Location $dir
#Get file names to run
$FileNames = Get-ChildItem .\Create -Filter *.sql

#Run SQLCMD for each file
ForEach ($FileName in $FileNames)
{
Write-Host $FileName.BaseName
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $FileName.FullName

}

$FileNames = Get-ChildItem .\Sproc -Filter *.sql

#Run SQLCMD for each sproc
ForEach ($FileName in $FileNames)
{

Write-Host $FileName.BaseName
$sb={
param($fullName, $dbId, $db, $pwd)
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fullName
}
Start-Job -ScriptBlock $sb -ArgumentList $($FileName.FullName), $dbId, $db, $pwd
}

#Get file names to run
$FileNames = Get-ChildItem .\SeedData

#Run BCP for each file
ForEach ($FileName in $FileNames)
{
Write-Host $FileName.BaseName
$sb={
param($baseName, $fullName, $dbId, $db, $pwd)
bcp EMR.dbo.$baseName in $fullName -c  -U $dbId -S $db -P $pwd
}
Start-Job -ScriptBlock $sb -ArgumentList $($FileName.BaseName), $($FileName.FullName), $dbId, $db, $pwd
}


#Wait for all jobs
Get-Job | Wait-Job

#Get all job results
Get-Job | Receive-Job

$FileNames = Get-ChildItem .\DataIntegrity\step0 -Filter *.sql

#Run SQLCMD for each file
ForEach ($FileName in $FileNames)
{

Write-Host $FileName.BaseName
$sb={
param($fullName, $dbId, $db, $pwd)
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fullName
}
Start-Job -ScriptBlock $sb -ArgumentList $($FileName.FullName), $dbId, $db, $pwd
}

#Wait for all jobs
Get-Job | Wait-Job

#Get all job results
Get-Job | Receive-Job

#Get file names to run
$FileNames = Get-ChildItem .\DataIntegrity -Filter *.sql

#Run SQLCMD for each file
ForEach ($FileName in $FileNames)
{

Write-Host $FileName.BaseName
$sb={
param($fullName, $dbId, $db, $pwd)
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fullName
}
Start-Job -ScriptBlock $sb -ArgumentList $($FileName.FullName), $dbId, $db, $pwd
}
#Wait for all jobs
Get-Job | Wait-Job

#Get all job results
Get-Job | Receive-Job


$FileNames = Get-ChildItem .\DataIntegrity\step2 -Filter *.sql

#Run SQLCMD for each file
ForEach ($FileName in $FileNames)
{

Write-Host $FileName.BaseName
$sb={
param($fullName, $dbId, $db, $pwd)
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fullName
}
Start-Job -ScriptBlock $sb -ArgumentList $($FileName.FullName), $dbId, $db, $pwd
}

#Wait for all jobs
Get-Job | Wait-Job

#Get all job results
Get-Job | Receive-Job


Pop-Location

$stopWatch.Stop()

Write-Host "Total time taken in ms is " $($stopWatch.ElapsedMilliseconds)