# 実行中のパス取得/移動
$path = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $path

# StreamReaderのコンストラクタに直接 「$path + "\test.txt"」を入力するとエラーになるので分ける
$fileName = $path + "\test.txt"

$cycle = 0
# ファイルの存在確認＆新規作成
if ( Test-Path $fileName){ 
    $dat = Get-Content $fileName
    $cycle = [int]$dat[0] + 1
    Write-Host $cycle
} else {
    Write-Host "File generated"
    $cycle = 1
    Write-Output $cycle | Set-Content -Encoding Default $fileName
}

$date = Get-Date
Write-Output $cycle | Set-Content -Encoding Default $fileName
Write-Output $date  | Add-Content -Encoding Default $fileName

# END
Write-Host("END")