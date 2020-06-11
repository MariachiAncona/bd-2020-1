/* 1 
Seleccionar el número total de artículos que pertenecen a las subastas del 2010,
así como el total de los ingresos obtenidos en las subastas del 2010.
Emplear como nombres de columnas: num_articulos, ingresos. Emplear sintaxis 
estándar.
R: Se han vendido 309 artículos
*/

create table consulta_1 as
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

/*
2. Mostrar el total de artículos que no fueron vendidos en las subastas del 2010
R: El resultado debe estar entre 187 y 190
*/

create table consulta_2 as 
    select count(*) as total_articulos
    from subasta s
    join articulo a
        on s.subasta_id=a.subasta_id
    join status_articulo sa
        on a.status_articulo_id= sa.status_articulo_id
    where s.fecha_inicio between to_date('01/01/2010','dd/mm/yyyy') 
        and to_date('31/12/2010','dd/mm/yyyy')
        and sa.clave <> 'VENDIDO' 
        and sa.clave <> 'ENTREGADO';


/*
3.Generar una consulta que contenga las siguientes columnas considerando 
únicamente a la subasta ‘EXPO-MAZATLAN’
Precio inicial del artículo más barato ARTICULO.PRECIO_INICIAL 
Precio Inicial más caro
Precio de venta más barato,         SUBASTA_VENTA.PRECIO_VENTA
Precio de venta más caro
R: El resultado es un solo registro con las 4 columnas anteriores, el precio más
barato de compra es 34001.52.
*/
    
select min(a.precio_inicial) as "Precio inicial más barato",
    max(a.precio_inicial) as "Precio inicial más caro",
    min(sv.precio_venta) as "Precio venta más barato",
    max(sv.precio_venta) as "Precio venta más caro"
from subasta s
join articulo a
    on a.subasta_id = s.subasta_id
join subasta_venta sv
    on a.articulo_id = sv.articulo_id
where s.nombre = 'EXPO-MAZATLAN';

/*
4. Se ha detectado que en la base de datos existen clientes nacidos entre los 
años 1970 y 1975 que tienen registrada al menos una tarjeta de crédito,
pero que no han comprado artículos en las subastas. Generar un reporte que 
muestre el identificador, el email y el número de tarjeta de dichos
clientes. Tip: Los clientes que no han comprado artículos no tienen registro en 
subasta_venta.
R: Se obtiene un solo registro.
*/

select c.cliente_id, c.email, tc.numero_tarjeta----------------Pendiente
from (select cliente_id from subasta_venta) q1,
    tarjeta_cliente tc
join cliente c
    on tc.cliente_id = c.cliente_id
join subasta_venta sv
    on c.cliente_id = sv.cliente_id
where sv.factura_cliente_id is NULL
    and c.fecha_nacimiento between to_date('01/01/1970','dd/mm/yyyy') 
    and to_date('31/12/1975','dd/mm/yyyy')
    and c.cliente_id <> (q1.cliente_id);-----------------------Pendiente
    
/*
5. Se desea generar un reporte estadístico que contenga la cantidad de artículos
que hayan sido vendidos o entregados para cada uno de los tipos
existentes. Genere una sentencia SQL que genere el reporte solicitado mostrando 
el número de artículos, el tipo de artículo y la clave del status.
R: Se deben obtener 6 registros.
*/

select sum(q2.numero_articulos), q2.tipo_articulo, sa.clave
from (select count(*) as numero_articulos,
                tipo_articulo, 
                status_articulo_id
        from articulo
        group by tipo_articulo, status_articulo_id) q2,
    status_articulo sa
where sa.clave = 'ENTREGADO'
    or sa.clave = 'VENDIDO'
group by q2.tipo_articulo, sa.clave;



/*
6. Suponga que se desea generar un reporte anual que muestre los totales 
recaudados en cada subasta realizada en el 2009, y por cada tipo de artículo.
Genere un reporte que muestre, el nombre de la subasta, la fecha de inicio, el 
lugar en la que se realizó, el tipo de articulo y el monto total recaudado
ordenadas del mayor al menor monto obtenido Emplear notación SQL estándar.
R: Se deben obtener 18 registros.
*/

select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo, 
  sum(sv.precio_venta) as monto_total
from subasta s
join articulo a
  on s.subasta_id = a.subasta_id
join subasta_venta sv
  on sv.articulo_id = a.articulo_id
where s.fecha_inicio between to_date('01/01/2009','dd/mm/yyyy') 
        and to_date('31/12/2009','dd/mm/yyyy')
group by s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo
order by 5 desc;


