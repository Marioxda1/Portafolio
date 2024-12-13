#!/bin/bash

# Título del reporte
echo "Reporte de recursos del sistema - $(date)" > system_report.html

# Uso de CPU
echo "<h3>Uso de CPU:</h3>" >> system_report.html
top -b -n1 | head -5 >> system_report.html

# Uso de memoria
echo "<h3>Uso de Memoria:</h3>" >> system_report.html
free -h >> system_report.html

# Espacio en disco
echo "<h3>Espacio en Disco:</h3>" >> system_report.html
df -h >> system_report.html

# Actividad de red
echo "<h3>Actividad de Red:</h3>" >> system_report.html
ifconfig | grep -E "inet|RX|TX" >> system_report.html

echo "Reporte generado: system_report.html"

