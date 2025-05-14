@echo off
cd /d "%~dp0"

echo Uruchamianie 4.py...
python 4.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 4.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "4.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit