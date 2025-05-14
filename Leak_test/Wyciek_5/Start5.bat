@echo off
cd /d "%~dp0"

echo Uruchamianie 5.py...
python 5.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 5.py
    pause
    exit /b %errorlevel%
)

echo Uruchamianie pliku wykresu...

start "" "5.Wykres.xlsm"
:: start "" "1.Wynik.xlsx"
REM start "" "1.Wynik.xlsx" REM

exit