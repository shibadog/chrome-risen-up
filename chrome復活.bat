@echo off
rem https://qiita.com/resolver/items/7187bd6ee8016ee5c741

rem �������擾����
set now_date=%DATE: =0%
    set now_date=%now_date:~0,4%%now_date:~5,2%%now_date:~8,2%

set now_time=%time: =0%
    set now_time=%now_time:~0,2%%now_time:~3,2%%now_time:~6,2%

set now_dt=%now_date%%now_time%

rem �ꏊ�̈ړ�����
cd /d "%~dp0"

rem ���s�������������Z�b�g����
set syori_1=reg add "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v "RendererCodeIntegrityEnabled" /t "REG_DWORD" /d "0" /f

rem �G���[���N�������ׂ̈ɃG���[���x�����o�͂���
set syori_err_l=echo %%errorlevel%%

rem �Z�b�g�����R�}���h��bat�ɏo�͂���
echo %syori_1% >syori.bat
echo %syori_err_l% ^>"%~dp0"err_%now_dt%.log >>syori.bat

rem powershell�ŊǗ��Ҍ����ŏo����bat�����s����
powershell start-process syori.bat -verb runas

rem �������I���܂ł��傢�҂�
@ping localhost -n 5 > nul

rem �o�͂��ꂽ�G���[���x�����擾����
set /p err_l_get=<./err_%now_dt%.log

rem �G���[���x���ŏ����̐��ۂ𔻒�
if %err_l_get% == 0 (
    echo ��������!!!
) else (
    echo �����G���[�@�w���v�ɖ₢���킹��
    goto err_go
)

rem �g���I�����bat��log������
del syori.bat

del err_%now_dt%.log

echo �L�[�{�[�h���ǂꂩ�����ƕ���

@pause  > nul

exit


:err_go
rem  �G���[���̏���

rem �g���I�����bat������
del syori.bat

echo �L�[�{�[�h���ǂꂩ�����ƕ���

@pause > nul

exit
