#!/bin/bash

# Leer la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# Consultar la URL de GitHub API
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s "$API_URL")

# Extraer datos del JSON
USER_ID=$(echo "$JSON_RESPONSE" | jq -r '.id')
CREATED_AT=$(echo "$JSON_RESPONSE" | jq -r '.created_at')

# Imprimir mensaje
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Crear un directorio temporal con la fecha actual
LOG_DIR="/tmp/$(date +'%Y%m%d')"
mkdir -p "$LOG_DIR"

# Crear un archivo de registro con la salida del mensaje
LOG_FILE="$LOG_DIR/saludos.log"
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." > "$LOG_FILE"

# Crear un cronjob para que el script se ejecute cada 5 minutos
CRON_CMD="*/5 * * * * $(realpath $0)"
(crontab -l ; echo "$CRON_CMD") | crontab -

echo "Script configurado y cronjob creado."


chmod +x consulta_github.sh
