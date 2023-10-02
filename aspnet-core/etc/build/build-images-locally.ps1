param ($version='latest')

$currentFolder = $PSScriptRoot
$slnFolder = Join-Path $currentFolder "../../"

Write-Host "********* BUILDING DbMigrator *********" -ForegroundColor Green
$dbMigratorFolder = Join-Path $slnFolder "src/Acme.BookStore.DbMigrator"
Set-Location $dbMigratorFolder
dotnet publish -c Release
docker build -f Dockerfile.local -t acme/bookstore-db-migrator:$version .

Write-Host "********* BUILDING Angular Application *********" -ForegroundColor Green
$angularAppFolder = Join-Path $slnFolder "../angular"
Set-Location $angularAppFolder
yarn
npm run build:prod
docker build -f Dockerfile.local -t acme/bookstore-angular:$version .

Write-Host "********* BUILDING Api.Host Application *********" -ForegroundColor Green
$hostFolder = Join-Path $slnFolder "src/Acme.BookStore.HttpApi.Host"
Set-Location $hostFolder
dotnet publish -c Release
docker build -f Dockerfile.local -t acme/bookstore-api:$version .

### ALL COMPLETED
Write-Host "COMPLETED" -ForegroundColor Green
Set-Location $currentFolder