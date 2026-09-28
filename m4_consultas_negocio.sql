-- ════════════════════════════════════════════════════════
-- RetailPro — M4 Consultas SQL de Negocio
-- Autor: Manuel Silva
-- Fecha: 2026-09-28
-- Base: Ventas_Tech_DB (tabla: ventas)
-- ════════════════════════════════════════════════════════

-- ========================================================
-- Consulta 1 — Resumen ejecutivo mensual
-- Total facturado, cantidad de pedidos y ticket promedio.
-- Se calcula total como cantidad * precio_unitario.
-- Agrupado por mes usando EXTRACT(MONTH FROM fecha_venta).
-- ========================================================

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;


-- ========================================================
-- Consulta 2 — Ranking de productos
-- Top 5 de id_producto por total facturado.
-- Mostrar unidades vendidas y total generado.
-- ========================================================

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;


-- ========================================================
-- Consulta 3 — Clientes recurrentes
-- id_cliente con más de un pedido.
-- Mostrar cantidad de pedidos y total gastado.
-- ========================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;


-- ========================================================
-- Consulta 4 — Meses por encima/por debajo del promedio
-- Total facturado por mes + etiqueta con CASE WHEN.
-- ========================================================

WITH facturacion_mensual AS (
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >
            (SELECT AVG(total_facturado) FROM facturacion_mensual)
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;


-- ========================================================
-- Bloque de cierre — Hallazgos del análisis
-- ========================================================
-- 1) El producto con mayor facturación supera ampliamente al resto,
--    concentrando una parte significativa de los ingresos totales.
-- 2) Los clientes recurrentes representan una proporción importante
--    del total facturado, indicando oportunidades de fidelización.
-- 3) Hay meses con facturación muy por encima del promedio,
--    lo que sugiere estacionalidad clara en las ventas.
