Write-Host "Clean..."
Get-ChildItem * -Include *.c,*.h,*.exe -Exclude *flex*,*bison*
$clean = Read-Host "Confirm cleaning these files?(y/n)"
if ($clean -eq "y") {
    Write-Host "cleaning..."
    Remove-Item * -Include *.c,*.h,*.exe -Exclude *flex*,*bison*
}
