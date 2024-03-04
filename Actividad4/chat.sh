#!/bin/bash

# Crear named pipes si no existen
if [[ ! -p chat1 ]]; then
    mkfifo chat1
fi

if [[ ! -p chat2 ]]; then
    mkfifo chat2
fi

# Limpiar los named pipes
> chat1
> chat2

# Leer mensajes de un usuario y enviarlos al otro usuario
while true; do
    if read -r message; then
        echo "[Usuario 1] $message" > chat2
    fi
done < chat1 &
pid1=$!

# Leer mensajes del otro usuario y enviarlos al usuario actual
while true; do
    if read -r message; then
        echo "[Usuario 2] $message" > chat1
    fi
done < chat2 &
pid2=$!

# Esperar a que ambos procesos hijos finalicen
trap "kill $pid1 $pid2" EXIT

# Esperar
wait
