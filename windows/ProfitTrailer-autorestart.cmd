:: Change restart time at line 15

@echo off

:loop
echo ######### START APPLICATION %time:~-11,2%:%time:~-8,2%:%time:~-5,2%  - %date:~-4%-%date:~-7,2%-%date:~-10,2% #########
echo %time:~-11,2%:%time:~-8,2%:%time:~-5,2% - start Profit Trailer
start "ProfitTrailer" java -jar ProfitTrailer.jar -XX:+UseConcMarkSweepGC -Xmx512m -Xms512m

:: First close Browser and than wait 60 seconds * 60 minutes * 4 houres = 10800 - first 25 timeout seconds = 10775
timeout /t 25 >null
echo.
echo ######### CLOSE BROWSER TAB %time:~-11,2%:%time:~-8,2%:%time:~-5,2%  - %date:~-4%-%date:~-7,2%-%date:~-10,2% #########
taskkill /F /FI "WindowTitle eq ProfitTrailer Login*" /T >null
timeout /t 10775 >null

echo.
echo ######### CLOSE APPLICATION %time:~-11,2%:%time:~-8,2%:%time:~-5,2%  - %date:~-4%-%date:~-7,2%-%date:~-10,2% #########
echo %time:~-11,2%:%time:~-8,2%:%time:~-5,2% - close Java Application
taskkill /IM java.exe /F >null
echo %time:~-11,2%:%time:~-8,2%:%time:~-5,2% - close Profit Trailer
taskkill /F /FI "WindowTitle eq "Profit*"" /T >null
timeout /t 7 >null
echo.
echo.
goto loop