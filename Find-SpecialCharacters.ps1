# This script has been created for the the sole pupose of quickly validating a TXT file of any potential Special Characters


Write-Verbose "#######################################################################################" -Verbose
Write-Verbose "########################### File Special Characters Checker ###########################" -Verbose
Write-Verbose "#######################################################################################" -Verbose

#Path

Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    Multiselect = $false # Multiple files can be not be chosen
	Filter = 'TXT (*.txt)|*.txt' # Specified file types
}

[void]$FileBrowser.ShowDialog()

$txtfile = $FileBrowser.FileName;

# Checks if a file was selected, if not quit the script
if ($txtfile -like $null){
Write-Output "You have not specified a Text file.... Script quitting"
Start-Sleep 100
Exit
}
else {
# Imports the CSV file which was selected in Windows Explorer
$Path = $txtfile
}


Write-Verbose "The following file $Path has been selected" -Verbose

Write-Verbose "Searching for special characters... please wait" -Verbose



$nonASCII = "[^\x00-\x7F]"
foreach ($_ in [System.IO.File]::ReadLines($Path)){
    if ($_ -cmatch $nonASCII){
        Write-Verbose $_ -Verbose       
    }
}
Write-Verbose "" -Verbose
Write-Verbose "Completed search" -Verbose
