import csv
from openpyxl import Workbook
from openpyxl.chart import LineChart, Reference

pliki_csv = ['red4.csv', 'yellow4.csv', 'green4.csv', 'blue4.csv']
dane_czasowe = {}

# Wczytanie danych z plików
for idx, nazwa_pliku in enumerate(pliki_csv):
    with open(nazwa_pliku, newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            if len(row) < 6:
                continue  # Pomijamy niepełne wiersze
            czas = row[1]
            wartosc = f"{row[4]},{row[5]}"
            if czas not in dane_czasowe:
                dane_czasowe[czas] = [None] * 4
            dane_czasowe[czas][idx] = wartosc

# Filtrowanie pełnych wierszy
czasy_z_pelnymi_danymi = [czas for czas, wartosci in dane_czasowe.items() if all(wartosci)]
czasy_z_pelnymi_danymi.sort()

# Tworzenie pliku Excel
wb = Workbook()
ws = wb.active
ws.title = "Dane"

# Nagłówki
ws.append(["Czas", "Wartość_red", "Wartość_yellow", "Wartość_green", "Wartość_blue"])

# Dodawanie danych
for czas in czasy_z_pelnymi_danymi:
    wartosci = dane_czasowe[czas]
    ws.append([czas] + wartosci)

# Ustawienie stałej szerokości dla kolumn
ws.column_dimensions['A'].width = 15  # Kolumna Czas
ws.column_dimensions['B'].width = 12  # Kolumna Wartość_red
ws.column_dimensions['C'].width = 12  # Kolumna Wartość_yellow
ws.column_dimensions['D'].width = 12  # Kolumna Wartość_green
ws.column_dimensions['E'].width = 12  # Kolumna Wartość_blue

# Tworzenie wykresu
chart = LineChart()
chart.title = "Wartości wg czasu"
chart.style = 10
chart.y_axis.title = "Wartość"
chart.x_axis.title = "Czas"

# Zakres danych (B2:E(N))
dane_ref = Reference(ws, min_col=2, max_col=5, min_row=1, max_row=1+len(czasy_z_pelnymi_danymi))
# Etykiety X (czas) A2:A(N)
kat_ref = Reference(ws, min_col=1, min_row=2, max_row=1+len(czasy_z_pelnymi_danymi))

chart.add_data(dane_ref, titles_from_data=True)
chart.set_categories(kat_ref)

# Dodaj wykres do arkusza
ws.add_chart(chart, "G10")

# Zapisz plik
wb.save("4.Wynik.xlsx")
print("4.Wynik.xlsx")
