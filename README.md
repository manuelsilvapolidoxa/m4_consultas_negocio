📄 README — M4 Consultas de Negocio (RetailPro)
Descripción
Este repositorio contiene el archivo m4_consultas_negocio.sql, correspondiente a la pre‑entrega del Módulo 4 del curso de Data Analytics.
El objetivo es extraer métricas clave de negocio desde la base de datos Ventas_Tech_DB, utilizando consultas SQL sobre la tabla ventas.
Estas consultas serán la base para la integración con Power BI en el Módulo 6.

Estructura del repositorio
Código
m4_consultas_negocio/
└── m4_consultas_negocio.sql

Contenido del archivo SQL
El archivo incluye las cuatro consultas solicitadas en el brief:
1) Resumen ejecutivo mensual
Total facturado
Cantidad de pedidos
Ticket promedio
Agrupado por mes con EXTRACT(MONTH FROM fecha_venta)
2) Ranking de productos
Top 5 productos por total facturado
Unidades vendidas
Total generado
Ordenado por facturación descendente
3) Clientes recurrentes
Clientes con más de un pedido
Cantidad de pedidos
Total gastado
Uso de HAVING COUNT(*) > 1
4) Meses por encima / por debajo del promedio
Total facturado por mes
Comparación con el promedio general
Etiqueta con CASE WHEN

Hallazgos del análisis
El archivo incluye un bloque final con 3 hallazgos de negocio, derivados de las consultas ejecutadas sobre la tabla ventas.
