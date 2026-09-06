-- =========================================================
-- MÓDULO 5: CONSULTAS CON JOINs
-- Base de datos: Ventas_Tech_DB
-- =========================================================


-- =========================================================
-- CONSULTA 1: Vista base del proyecto (INNER JOIN)
-- =========================================================

SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    c.ciudad,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria;


-- =========================================================
-- CONSULTA 2: Clientes sin ventas (LEFT JOIN)
-- =========================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- =========================================================
-- CONSULTA 3: Productos sin ventas (LEFT JOIN)
-- =========================================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;


-- =========================================================
-- CONSULTA 4: Consolidado por canal (UNION ALL)
-- =========================================================

SELECT
    canal,
    SUM(total_venta) AS total_ventas
FROM (
    SELECT
        (v.cantidad * v.precio_unitario) AS total_venta,
        'Online' AS canal
    FROM ventas v
    WHERE v.id_venta <= 5

    UNION ALL

    SELECT
        (v.cantidad * v.precio_unitario) AS total_venta,
        'Presencial' AS canal
    FROM ventas v
    WHERE v.id_venta > 5
) AS ventas_por_canal
GROUP BY canal;
