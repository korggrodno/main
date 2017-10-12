##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: September 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Требуем от ребенка правильное написание пароля согласно подсказке - После этого запускаем exe на 5 минут. 
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt",						# файл для накопления логов
		[string]$exe_path		= "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"	# Exe запуск которого является наградой за старания
)

$old_location = Get-Location
# Задаем текущее местоположение равное местоположению скрипта
$script_location = Split-Path -parent $MyInvocation.MyCommand.Definition
set-location $script_location
	
	.\_enter_pass_v1.ps1 -exe_path $exe_path
	
	.\_minimize_ps.ps1

	start-sleep -seconds 300
	
	$process_name = .\_parse_exe.ps1 -exe_path $exe_path
	.\_kill_process.ps1 -process_name $process_name
	
set-location $old_location