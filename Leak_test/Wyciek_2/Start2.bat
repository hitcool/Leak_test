@echo off
cd /d "%~dp0"

echo Uruchamianie 2.py...
python 2.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 2.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "2.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit