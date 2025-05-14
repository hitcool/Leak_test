@echo off
cd /d "%~dp0"

echo Uruchamianie 3.py...
python 3.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 3.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "3.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit