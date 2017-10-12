##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: September 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Скрипт требует ввод случайного пароля из base_pass.txt до тех пор пока пароль не будет введен верно. 
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$msg			= "<No Msg>",							# текст сообщения
		[string]$log_all		= "log_all.txt"							# файл для накопления логов
)

Add-Type -AssemblyName System.speech 
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer 
$speak.SelectVoice('Microsoft Irina Desktop')

	$pass = Get-Content "base_pass.txt"
	$ind = $true
	$str_rezult = ""	
	Write-Host "Чтобы получить доступ к мультикам введите вам нужно напечатать слово:"
	$pass_index= Get-Random -min 0 -max ( $pass.Length - 1 )
	Write-Host $pass[ $pass_index]
	
	while ( $ind -eq $true ){
	
		$key = [console]::ReadKey($true)
		write-host -NoNewline $key.KeyChar
		[string]$str = $key.KeyChar
		if ( ( $key.KeyChar -eq 8 ) -and ( $str_rezult.length -gt 0  ) ) { 
			$str_rezult = $str_rezult.Substring(0,($str_rezult.length-1))
		} else { 
			if ( $key.KeyChar -eq 13 ) { 
				if ( $str_rezult -eq $pass[ $pass_index] ) { 
					$ind = $false
					start-process $exe_path
				} 
				else {  
					Write-Host "Чтобы получить доступ к мультикам введите вам нужно напечатать слово:"
					$pass_index= Get-Random -min 0 -max ( $pass.Length - 1 )
					Write-Host $pass[ $pass_index]
					$str_rezult = ""
				}
			} else { $str_rezult += $str }
		}
		$speak.Speak($str_rezult)
	}

return $str_rezult