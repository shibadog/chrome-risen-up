@echo off
rem https://qiita.com/resolver/items/7187bd6ee8016ee5c741

rem 日時を取得する
set now_date=%DATE: =0%
    set now_date=%now_date:~0,4%%now_date:~5,2%%now_date:~8,2%

set now_time=%time: =0%
    set now_time=%now_time:~0,2%%now_time:~3,2%%now_time:~6,2%

set now_dt=%now_date%%now_time%

rem 場所の移動する
cd /d "%~dp0"

rem 実行したい処理をセットする
set syori_1=reg add "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v "RendererCodeIntegrityEnabled" /t "REG_DWORD" /d "0" /f

rem エラーが起きた時の為にエラーレベルを出力する
set syori_err_l=echo %%errorlevel%%

rem セットしたコマンドをbatに出力する
echo %syori_1% >syori.bat
echo %syori_err_l% ^>"%~dp0"err_%now_dt%.log >>syori.bat

rem powershellで管理者権限で出来たbatを実行する
powershell start-process syori.bat -verb runas

rem 処理が終わるまでちょい待つ
@ping localhost -n 5 > nul

rem 出力されたエラーレベルを取得する
set /p err_l_get=<./err_%now_dt%.log

rem エラーレベルで処理の成否を判定
if %err_l_get% == 0 (
    echo 処理完了!!!
) else (
    echo 処理エラー　ヘルプに問い合わせて
    goto err_go
)

rem 使い終わったbatとlogを消す
del syori.bat

del err_%now_dt%.log

echo キーボードをどれか押すと閉じる

@pause  > nul

exit


:err_go
rem  エラー時の処理

rem 使い終わったbatを消す
del syori.bat

echo キーボードをどれか押すと閉じる

@pause > nul

exit
