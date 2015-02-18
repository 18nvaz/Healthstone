:: Make a CSharp service and install it
@echo off
net stop Healthstone
mkdir %SYSTEMROOT%\healthstone > nul
%SYSTEMROOT%\Microsoft.NET\Framework\v3.5\csc.exe /out:..\bin\healthstone.exe healthstone.cs
IF ERRORLEVEL 1 GOTO end
copy ..\bin\healthstone.cfg %SYSTEMROOT%\healthstone\healthstone.cfg
copy ..\bin\healthstone.exe %SYSTEMROOT%\healthstone\healthstone.exe
%SYSTEMROOT%\System32\sc.exe create Healthstone binpath= %SYSTEMROOT%\healthstone\healthstone.exe type= own start= auto
%SYSTEMROOT%\System32\sc.exe description Healthstone "Healhstone System Monitor"
net start Healthstone
:end