::cancelamos el echo para que no moleste
 @echo off
 ::mostramos la ruta y el nombre de este bat
 echo estas ejecutando el archivo %0
 ::si se nos pasó algún parámetro, lo mostramos
 if not "%1"=="" (
     echo pasaste el parámetro ruta de log  %1
 ) else (
     echo no pasaste ningún argumento al programa
 )

set anio=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%
set hora=%time:~0,2%
set hora=%hora: =0%
set minuto=%time:~3,2%


"C:\Program Files (x86)\WinSCP\WinSCP.exe" ^
  /log="%1\FTP_PUROFARMA_%anio%%mes%%dia%_%hora%%minuto%.log" /ini=nul ^
  /command ^
    "open ftp://user:password@ip/ -rawsettings ProxyPort=0" ^
	"lcd \\10.1.240.16\Compartidos\Mercadeo\Productos " ^
	"synchronize  remote " ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

exit /b %WINSCP_RESULT%




