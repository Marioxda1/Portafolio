#!/bin/bash

# Directorio donde se guardarán las copias de seguridad
BACKUP_DIR="./backups"

# Crear el directorio de backups si no existe
mkdir -p $BACKUP_DIR

# Función para realizar un backup
backup() {
    read -p "Ingrese la ruta de la carpeta o archivo a respaldar: " SOURCE
    if [ -e "$SOURCE" ]; then
        BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d%H%M%S).tar.gz"
        tar -czf "$BACKUP_FILE" "$SOURCE"
        echo "Backup completado: $BACKUP_FILE"
    else
        echo "La ruta especificada no existe."
    fi
}

# Función para restaurar un backup
restore() {
    echo "Copias de seguridad disponibles:"
    ls -1 $BACKUP_DIR
    read -p "Ingrese el nombre del archivo de backup a restaurar: " BACKUP_FILE
    if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
        read -p "Ingrese la ruta de destino para restaurar los datos: " DESTINATION
        mkdir -p "$DESTINATION"
        tar -xzf "$BACKUP_DIR/$BACKUP_FILE" -C "$DESTINATION"
        echo "Restauración completada en: $DESTINATION"
    else
        echo "El archivo de backup no existe."
    fi
}

# Menú principal
while true; do
    echo "Seleccione una opción:"
    echo "1. Realizar Backup"
    echo "2. Restaurar Backup"
    echo "3. Salir"
    read -p "Opción: " OPTION
    case $OPTION in
        1) backup ;;
        2) restore ;;
        3) echo "Saliendo..."; break ;;
        *) echo "Opción inválida. Intente de nuevo." ;;
    esac
done
