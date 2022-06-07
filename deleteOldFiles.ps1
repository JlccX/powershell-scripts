cd "C:\tmp\logs"

# Command used to recover logs that were created 6 Months ago or more.
# This files will be deleted because are not required anymore and because we need to release hdd space.
$oldFiles = Get-ChildItem -File | Select Name,CreationTime | Where-Object {$_.CreationTime -lt (Get-Date).AddMonths(-6).Date}

# This iteration will delete all the files that are longer than 6 Months of creation.
Foreach ($item in $oldFiles)
{
    $fileToRemove = $item | % Name
    Write-Output "The log removed is: $fileToRemove"
    Remove-Item $fileToRemove
}
