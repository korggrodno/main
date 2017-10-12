##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: September 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description:
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt",						# файл для накопления логов
		[string]$exe_path		= "C:\Program Files\Mozilla Firefox\firefox.exe"
		
)

$old_location = Get-Location
# Задаем текущее местоположение равное местоположению скрипта
$script_location = Split-Path -parent $MyInvocation.MyCommand.Definition
set-location $script_location
	
	.\_start_exe.ps1 -exe_path $exe_path
	
set-location $old_location
