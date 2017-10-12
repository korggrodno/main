##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: September 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Скрипт устанавливает русский язык ввода в окно powershell
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt"							# файл для накопления логов
)

$old = Get-WinUserLanguageList
Set-WinUserLanguageList -LanguageList ru -Confirm:$false -Force
# Здесь производим использование русской раскладки. 
# Если не будет выполнена последняя команда этого скрипта в системе слетят все раскладки. 
Set-WinUserLanguageList -LanguageList $old -Confirm:$false -Force