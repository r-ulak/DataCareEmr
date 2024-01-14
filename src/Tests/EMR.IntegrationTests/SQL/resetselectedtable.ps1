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
$tables = Get-Content resettable.txt


#Run SQLCMD for each file
ForEach ($fileName in $tables)
{
$fileName = $dir +"\Create\" + $fileName + ".sql"
Write-Host $fileName
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fileName 

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




#Run BCP for each file
ForEach ($fileName in $tables)
{
$fullName = $dir + "\SeedData\" + $fileName + ".txt"
Write-Host $fullName
$sb={
param($baseName, $fullName, $dbId, $db, $pwd)
bcp EMR.dbo.$baseName in $fullName -c  -U $dbId -S $db -P $pwd
}
Start-Job -ScriptBlock $sb -ArgumentList $($fileName), $($fullName), $dbId, $db, $pwd
}


#Wait for all jobs
Get-Job | Wait-Job

#Get all job results
Get-Job | Receive-Job


#Run dataIntegrity- for each file
ForEach ($fileName in $tables)
{
$fileName = $dir + "\DataIntegrity\dataIntegrity-" + $fileName + ".sql"
Write-Host $fileName
sqlcmd -S $db -d EMR -U $dbId -P $pwd -i $fileName 
}






