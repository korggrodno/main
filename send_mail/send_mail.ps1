##########################################################################################################################
##      Author: kggr
##         URL: kggr.ru
##        Date: October 2011
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Отправка почтового сообщения через smtp сервер (умеет ssl соединение)
##   Relations:
##     Example:
##########################################################################################################################

param(
		[string]$Server			= "smtp.gmail.com",						# SMTP Сервер
		[switch]$SSL			= $true,								# Enable SSL 
		[string]$Password		= "",						# Password
		[string]$Username		= "",		# Username
		[string]$From			= "",		# Адрес отправителя
		[string[]]$To			= "",					# Получатели
		[string]$Subject		= "<No Subject>",						# Тема сообщения
		[string]$Body			= "<No Body>",							# Тело сообщения
		[System.IO.FileInfo[]]$Attachment=@()							# Вложения
)

$SmtpClient				= New-Object System.Net.Mail.SmtpClient
$Message 				= New-Object System.Net.Mail.MailMessage
$SmtpClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
$SmtpClient.EnableSsl	= $SSL
$SmtpClient.Host		= $Server
$Message.Body			= $Body
$Message.Subject		= $Subject
$Message.From			= $From
$Attachment | ForEach-Object {
	$a = New-Object System.Net.Mail.Attachment($_.fullname)
	$Message.Attachments.Add($a)
}
$To | ForEach-Object {$Message.To.Add($_)}

do {
	try { 
		$smtpclient.Send($Message) 
		.\..\_lib\out_msg.ps1 -msg "SEND MAIL SUCCESS ..." 
		$exit = $true
	} 
	catch {	
		.\..\_lib\out_msg.ps1 -msg "ERROR in send_mail.ps1 39 line" 
		$exit = $false
	}
} until ($exit)

$Message.Dispose()
