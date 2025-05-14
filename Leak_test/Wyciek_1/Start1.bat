@echo off
cd /d "%~dp0"

echo Uruchamianie 1.py...
python 1.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 1.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "1.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit