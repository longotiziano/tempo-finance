# database

En esta carpeta se concentra la lógica necesaria para la conexión con la base de datos, backups
tanto físicos como lógicos (necesarios para el arranque inicial del contenedor) y el script para 
guardar automáticamente copias del contenido.

## Estrategia de backup

La estrategia empleada es realizar backups incrementales de manera diaria, y de manera semanal
uno completo. El contenido será eliminado al alcanzar el mes de antigüedad.