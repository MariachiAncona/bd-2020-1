/* 1 
Seleccionar el número total de artículos que pertenecen a las subastas del 2010,
así como el total de los ingresos obtenidos en las subastas del 2010.
Emplear como nombres de columnas: num_articulos, ingresos. Emplear sintaxis 
estándar.
R: Se han vendido 309 artículos
*/

select q1.total_articulos, sum(sv.precio_venta) as ingresos
from
    (select count(*) as total_articulos
    from subasta s
    join articulo a
    on s.subasta_id=a.subasta_id
    join status_articulo sa
    on a.status_articulo_id= sa.status_articulo_id
    where s.fecha_inicio between to_date('01/01/2010','dd/mm/yyyy') 
        and to_date('31/12/2010','dd/mm/yyyy'))q1,
    subasta_venta sv
group by q1.total_articulos;

