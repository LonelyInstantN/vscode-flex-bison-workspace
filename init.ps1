$name = Read-Host "Input name"
New-Item ./$name -ItemType "directory"
Copy-Item ./template/__.l -Destination ./$name/$name.l
Copy-Item ./template/__.y -Destination ./$name/$name.y
Write-Host "`nCreated folder $name and $name.l & $name.y please cheack."