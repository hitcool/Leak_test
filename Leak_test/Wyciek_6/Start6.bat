@echo off
cd /d "%~dp0"

echo Uruchamianie 6.py...
python 6.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 6.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "6.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit