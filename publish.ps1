$ErrorActionPreference = 'Stop'
$git = 'C:\Program Files\Git\cmd\git.exe'
$gh = (Get-Command gh.exe -ErrorAction Stop).Source
$project = $PSScriptRoot
& $gh auth status
& $git -C $project push origin main
if ($LASTEXITCODE -ne 0) { throw 'Não foi possível enviar o projeto ao GitHub.' }
$old = $ErrorActionPreference; $ErrorActionPreference = 'Continue'
& $gh api --silent repos/paulo-santzs/draftdeck/pages 2> $null
$exists = $LASTEXITCODE -eq 0; $ErrorActionPreference = $old
if ($exists) { & $gh api --method PUT repos/paulo-santzs/draftdeck/pages -f build_type=workflow *> $null }
else { & $gh api --method POST repos/paulo-santzs/draftdeck/pages -f build_type=workflow *> $null }
if ($LASTEXITCODE -ne 0) { throw 'Não foi possível ativar o GitHub Pages.' }
Start-Sleep -Seconds 5
$runId = & $gh run list --repo paulo-santzs/draftdeck --workflow pages.yml --limit 1 --json databaseId --jq '.[0].databaseId'
if (-not $runId) { throw 'A publicação foi solicitada, mas ainda não apareceu no GitHub Actions.' }
& $gh run watch $runId --repo paulo-santzs/draftdeck --exit-status
if ($LASTEXITCODE -ne 0) { throw 'O GitHub Actions encontrou uma falha.' }
Write-Host 'DraftDeck publicado com sucesso: https://paulo-santzs.github.io/draftdeck/'
