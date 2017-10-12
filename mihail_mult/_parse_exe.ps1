##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: October 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Парсим полный путь к exe, чтобы получить имя процесса - Parsing the full path to the exe to get the name of the process
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt",						# файл для накопления логов
		[string]$exe_path		= "C:\Program Files\Mozilla Firefox\firefox.exe" # полный путь к exe файлу
)

$regular = '(?<=\\)\w+(?=\.exe)'
[string[]]$AllMatches = [regex]::matches($exe_path,$regular)
$result = $AllMatches[$AllMatches.length - 1]
return $result