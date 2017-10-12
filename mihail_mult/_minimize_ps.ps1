##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: October 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Минимизируем окно Powershell - Minimize window Powershell
##   Relations:
##     Example:
##########################################################################################################################

$sig = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
Add-Type -MemberDefinition $sig -name NativeMethods -namespace Win32
[Win32.NativeMethods]::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle,2)

