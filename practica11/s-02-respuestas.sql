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

create table consulta_3 as     
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

create table consulta_5 as
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

create table consulta_6 as
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

/*
7.
La empresa desea regalar un artículo a todos los clientes que cumplan con alguna
de las siguientes condiciones:
a. Que el cliente haya comprado más de 5 productos desde que se registró en la 
base de datos.
b. Que el monto total de todos los productos que haya comprado supere a los 
$3,000,000.
Generar una sentencia SQL empleando operadores del álgebra relacional 
(Set operators). Determine id, nombre, apellidos, numero de productos
comprados y monto total.
R: Los montos totales y el número de artículos son:
TOTAL NUM_ARTICULOS
========== =============
4487933.17 6
3542077.21 4
3034465.63 4
3421015.72 5
3083806.95 4
3859436.78 4
3116215.04 5
3481850.47 6
*/

/*
select c.cliente_id, count(*) as num_articulos, sum(sv.precio_venta) as total
from cliente c
join subasta_venta sv
on c.cliente_id = sv.cliente_id
group by c.cliente_id
having count(*) > 5 
  or  sum(sv.precio_venta) > 3000000;
*/

create table consulta_7 as
    select  c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
    count(*) as num_articulos, sum(sv.precio_venta) as total
    from cliente c
    join subasta_venta sv
    on c.cliente_id = sv.cliente_id
    group by  c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
    having count(*) > 5
    union
    select  c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
    count(*) as num_articulos, sum(sv.precio_venta) as total
    from cliente c
    join subasta_venta sv
    on c.cliente_id = sv.cliente_id
    group by  c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
    having sum(sv.precio_venta) > 3000000;

/*
9. Calcular el monto total de la última factura del cliente GALILEA GOMEZ GONZALEZ.
R: Se debe obtener $ 1765264.89
*/
create table consulta_9 as
    select sum(sv.precio_venta) as monto_total
    from cliente c
    join subasta_venta sv
    on c.cliente_id = sv.cliente_id
    join factura_cliente fc
    on fc.factura_cliente_id = sv.factura_cliente_id
    where fc.fecha_factura = (
    select max(fc.fecha_factura)
    from cliente c
    join subasta_venta sv
    on c.cliente_id = sv.cliente_id
    join factura_cliente fc
    on fc.factura_cliente_id = sv.factura_cliente_id
    where c.nombre = 'GALILEA'
        and c.apellido_paterno = 'GOMEZ'
        and c.apellido_materno = 'GONZALEZ');

/*
10. Suponga que, para el próximo año, la empresa va a repetir la misma ronda de 
subastas por el éxito que tuvieron durante el 2010 a excepto de todas
aquellas que hayan vendido 3 o menos artículos. Determinar id de la subasta, 
nombre, número de artículos vendidos de las subastas que podrán ser
repetidas ordenadas por id.
R: Se deben obtener 11 subastas.
*/


create table consulta_10 as
    select q1.subasta_id, s.nombre, q1.num_articulos
    from (
    select s.subasta_id, count(*) as num_articulos
    from subasta s, articulo a, subasta_venta sv
    where s.subasta_id = a.subasta_id
        and a.articulo_id = sv.articulo_id
    group by s.subasta_id
    having count(*) > 3
    ) q1, subasta s
    where q1.subasta_id = s.subasta_id
    and s.fecha_inicio between 
        to_date('01/01/2010','dd/mm/yyyy') and to_date('31/12/2010','dd/mm/yyyy')
    order by 1 asc;

/*
11. En julio del 2010 la empresa lanzó una promoción de venta de Motocicletas en
sus subastas. Se desea generar un reporte que muestre los siguientes
datos:
a. Identificador de la subasta, fecha de inicio, identificador del artículo, 
nombre del artículo, precio inicial del artículo de todas las
motocicletas que se vendieron o entregaron a un cliente en las subastas que se 
realizaron en el periodo que duró la promoción.
b. Agregar una columna más al reporte (columna de referencia), que indique el 
promedio del precio inicial de todas las motocicletas
considerando todo el año 2010 sin importar si estas fueron vendidas o entregadas
a un cliente.

R: Se debe obtener solo un artículo con id = 386, 
promedio general = 412386.15208333335
*/

select s.subsata_id, s.fecha_inicio, a.articulo_id, 
  a.nombre as "NOMBRE DEL ARTICULO", a.precio_inicial as "PRECIO INICIAL",
  (
    select avg(a.precio_inicial)
    from subasta_venta sv, articulo a, subasta s, status_articulo sa
    where sv.articulo_id = a.articulo_id
      and a.subasta_id = s.subasta_id
      and sa.status_articulo_id = a.status_articulo_id
      and sa.clave = 'VENDIDO' or sa.clave = 'ENTREGADO'
      and s.fecha_inicio between
        to_date('01/01/2010','dd/mm/yyyy') 
        and to_date('31/12/2010','dd/mm/yyyy')

select nombre from articulo order by 1;


/*
12. La empresa decide reconocer a ciertos países por su buena participación: 
Generar un reporte con todos los datos de los países que han donado 3 o
más artículos con un precio de venta inicial mayor a $300,000
R: Se deben obtener 2 países.
*/

select p.* 
from pais p, articulo_donado ad, articulo a, subasta_venta sv,
  (
  select p.pais_id, count(*) as num_donaciones
  from articulo_donado ad, pais p
  where ad.pais_id = p.pais_id
  group by p.pais_id
  having count(*) > 2;
  ) q1
where p.pais_id = ad.pais_id
  and ad.articulo_id = a.articulo_id
  and a.articulo_id = sv-articulo_id
  and q1.pais_id = p.pais_id

