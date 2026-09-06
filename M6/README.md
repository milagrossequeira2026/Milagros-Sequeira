Checkpoint M6 - Pipeline ETL con Power Query y lenguaje M

## Decisiones de limpieza de datos

### Dim_Clientes
Se eliminaron los registros duplicados utilizando `id_cliente` como criterio, ya que este campo debe identificar de manera única a cada cliente. Los valores nulos de `email` y `ciudad` se reemplazaron por "sin dato", en lugar de eliminar los registros, porque estos campos no son claves y la ausencia de esa información no invalida al cliente.

### Dim_Productos
Se eliminaron los productos duplicados utilizando `id_producto` como criterio para garantizar la unicidad de cada producto. La categoría nula se reemplazó por "Sin Categoría" para conservar el registro e identificar claramente la falta de clasificación. El precio nulo se imputó utilizando la mediana de los precios válidos (107,5), permitiendo conservar el producto y evitando que valores extremos influyan excesivamente en la imputación.
