@echo off
cd /d "%~dp0"

:: Sprawdzanie, czy Python jest zainstalowany
python --version >nul 2>nul
if %errorlevel% neq 0 (
    echo Python nie jest zainstalowany. Instalowanie...
    
    :: Pobranie i zainstalowanie Pythona
    set "python_installer=https://www.python.org/ftp/python/3.11.4/python-3.11.4.exe"
    set "installer=python_installer.exe"
    
    echo Pobieranie instalatora...
    powershell -Command "Invoke-WebRequest -Uri %python_installer% -OutFile %installer%"
    
    echo Uruchamianie instalatora...
    start /wait %installer% /quiet InstallAllUsers=1 PrependPath=1
    
    :: Usuwanie instalatora po zakończeniu
    del %installer%
    
    echo Instalacja Pythona zakończona.
) else (
    echo Python jest już zainstalowany.
)

:: Sprawdzanie, czy biblioteka openpyxl jest zainstalowana
python -c "import openpyxl" >nul 2>nul
if %errorlevel% neq 0 (
    echo Biblioteka openpyxl nie jest zainstalowana. Instalowanie...
    
    :: Instalowanie openpyxl
    pip install openpyxl
) else (
    echo Biblioteka openpyxl jest już zainstalowana.
)

:: Uruchamianie skryptu Python
echo Uruchamianie 1.py...
python 1.py

if %errorlevel% neq 0 (
    echo Wystąpił błąd podczas uruchamiania 1.py
    pause
    exit /b %errorlevel%
)

:: Uruchamianie pliku wykresu
echo Uruchamianie pliku wykresu...
start "" "1.Wykres.xlsm"

exit
