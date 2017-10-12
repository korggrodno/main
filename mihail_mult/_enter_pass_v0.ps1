##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: October 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Скрипт требует ввод случайного пароля из base_pass.txt до тех пор пока пароль не будет введен верно. 
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt",						# файл для накопления логов
		[string]$exe_path		= "C:\Program Files\Mozilla Firefox\firefox.exe"	# Exe запуск которого является наградой за старания
)

$pass = Get-Content "base_pass.txt"
	
$ind = $true
while ( $ind -eq $true ){
	Write-Host "Чтобы получить доступ к мультикам введите вам нужно напечатать слово:"
	$pass_index= Get-Random -min 0 -max ( $pass.Length - 1 )
	
	Write-Host $pass[ $pass_index]
	$pass_try = Read-Host
	if ( $pass[ $pass_index] -eq $pass_try )  { 
		start-process $exe_path
		$ind = $false
	}
}
