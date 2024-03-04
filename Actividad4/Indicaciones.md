# Chat básico usando Named Pipes y bash en Linux

Este es un chat básico que permite a dos usuarios comunicarse en tiempo real a través de la terminal utilizando Named Pipes y el shell de bash en Linux.

## Funcionamiento

1. El script `chat.sh` crea dos named pipes llamados `chat1` y `chat2` si no existen.
2. Inicia dos bucles en segundo plano: uno para leer los mensajes del usuario 1 y enviarlos al usuario 2, y otro para leer los mensajes del usuario 2 y enviarlos al usuario 1.
3. Cuando un usuario escribe un mensaje, se envía a través del named pipe correspondiente al otro usuario.
4. El proceso continúa hasta que uno de los usuarios cierra el chat.

## Uso

1. Ejecuta el script `chat.sh` en una terminal.
2. El usuario 1 escribirá mensajes en la terminal donde se ejecutó `chat.sh`, y el usuario 2 en otra terminal.
3. Los mensajes enviados por uno de los usuarios serán recibidos por el otro usuario en su terminal.

## Notas

- Este chat es muy básico y no incluye características como manejo de usuarios, historial de mensajes, etc.
- Para cerrar el chat, puedes simplemente presionar `Ctrl + C` en la terminal donde se está ejecutando `chat.sh`.

¡Disfruta chateando!
