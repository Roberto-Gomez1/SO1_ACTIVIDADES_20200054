# Manual tecnico 
* Se debe de crear un archivo con el nombre que se desee con extensión ".sh". El contenido que debe de tener el archivo sera el siguiente:  
```#!/bin/bash
while true; do
    echo "Hola! La fecha actual es: $(date)"
    sleep 1
done
```
* se tiene que dar permisos de ejecución (se necesita estar en la misma dirección que al archivo para que el comando funcione) 
```
chmod +x saludo.sh
```
* Posteriormente a eso se debe de crear un archivo de extension ".service". Dicho archivo debe de tener como contenido lo siguiente:
```
[Unit]
Description=Saludo y fecha actual

[Service]
ExecStart=/ruta/al/script/saludo.sh
Restart=always
User=nombre_de_usuario

[Install]
WantedBy=multi-user.target
```
* Ahora, se debe de mover el archivo 
```
sudo mv saludo.service /etc/systemd/system/
```
* Se debe de recargar los archivos de configuracion para que se reconozca el nuevo archivo
```
sudo systemctl daemon-reload
```
* Luego se tiene que habilitar el servicio 
```
sudo systemctl enable saludo.service
```
* Por ultimo se debe de iniciar el servicio
```
sudo systemctl start saludo.service
```
* Para verificar que esta funcionando 
```
sudo systemctl status saludo.service
```
* Para verificar los logs se usa el siguiente comando:
```
journalctl -u saludo.service
```