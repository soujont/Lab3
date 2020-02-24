<#

Purpose:  3rd Powershell lab, Practices use of: 
            Here-strings
            Piping commands
            Writing and reading files
            Conditional logic

Author: Jonathan Sourivong
File: Lab3Spring2020.ps1
Date: February 20,2020
#>

Clear-Host
set-locaion $env:USERPROFILE

Get-ChildItem -Filter *.txt |Format-Table -Property name,length

$WhatOptions= @"

What do you want to do?
    1. Write a contact entry to a file
    2. Display all files last written to after a given date 
    3. Read a specified text file
    

"@

$WhatOptions

$choice = Read-Host "Choose 1,2,or 3"

if ($choice -eq "1") {
    $name = Read-Host "Enter full name"
    $phone = Read-Host "Enter phone number"
    $email = Read-Host "Enter email"
    $filename = Read-Host "Enter file name"

    Add-Content -path $filename -Value $name,$phone,$email`n

    notepad $filename
    

}#1

elseif ($choice -eq "2") {
    $lastwrite = Read-Host "Earliest date of files to display"

    Get-ChildItem -Recurse | Where-Object -Property LastWriteTime -GE $lastwrite | Format-Table Name, LastWriteTime 

}#2

elseif ($choice -eq "3") {
    $textname = Read-Host "Enter text file name from profile"
    $isfile = Test-Path $textname
    if ($isfile -eq $true) {Get-Content $textname}
    else{Write-Output "File does not exist"}
}#3

else{
    Write-Output "Entered invalid response`n $env:computername`n $env:USERNAME"
}#else