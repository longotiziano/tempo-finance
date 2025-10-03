# database

En esta carpeta se concentra la lógica necesaria para la conexión con la base de datos, backups
tanto físicos como lógicos (necesarios para el arranque inicial del contenedor) y el script para 
guardar automáticamente copias del contenido.

## Estrategia de backup

La estrategia empleada es realizar backups incrementales de manera diaria, y de manera semanal
uno completo. El contenido será eliminado al alcanzar el mes de antigüedad.

## Tabla total_capital

En la tabla `total_capital` utilizo una `stored function` para mecanizar de una manera más simple y
segura su actualización en base a la tabla `financial_movements`. 
- `Stored function`:
```sql
CREATE OR REPLACE FUNCTION calculate_total_capital(p_capital_id integer, p_monto numeric)
RETURNS void AS $$
BEGIN
    UPDATE total_capitales
    SET total = total + p_monto
    WHERE capital_id = p_capital_id;
END;
$$ LANGUAGE plpgsql;
```