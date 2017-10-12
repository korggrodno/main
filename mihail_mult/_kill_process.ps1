##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: October 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Если вдруг Процесс открыт убиваем его - 
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt",						# файл для накопления логов
		[string]$process_name	= "firefox"								# Имя процесса который собираемся убить
)

	# если вдруг Браузер открыт убиваем его
    $i = Get-Process $process_name -ErrorAction SilentlyContinue
    while ($i -ne $null) {
	    Stop-Process -Name $process_name -ErrorAction:SilentlyContinue -ErrorVariable $err_null | Out-Null
	    $i = Get-Process $process_name -ErrorAction SilentlyContinue
    }
