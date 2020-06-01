--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  01/06/2020
--@Descripción:     Archivo que crea tablas con respuestas


/*
Genere un reporte que muestre nombre del artículo, clave, clave del status 
de todos los artículos donados por el artista ‘William Harvey’. Emplear
sintaxis estándar.
R: Se deben obtener 3 registros.
*/

/* 1
Genere un reporte que muestre nombre del artículo, clave, clave del status de 
todos los artículos donados por el artista ‘William Harvey’. Emplear
sintaxis estándar.
R: Se deben obtener 3 registros.

*/
create table as
    select a.nombre, a.clave_articulo, s.clave
    from status_articulo s
    join articulo a
    on a.status_articulo_id = s.status_articulo_id
    join articulo_famoso af
    on a.articulo_id = af.articulo_id
    where af.nombre_completo = 'William Harvey'
;


/* 2
Generar un reporte que muestre el id, nombre y clave de todos los artículos que
hayan sido entregados al cliente (status= ENTREGADO, no emplear
el id del status) en cualquier subasta y que hayan sido donados por 'BELGICA'.
Emplear natural join.
R: Se deben obtener 2 registros.

*/
create table as
    select articulo_id, nombre, clave_articulo
    from status_articulo s
    join articulo a using(status_articulo_id)
    natural join articulo_donado
    join pais p using(pais_id)
    where s.clave = 'ENTREGADO'
        and p.descripcion = 'BELGICA'
;

--Duda sobre usar el status_articulo_id

/* 3
Empleando natural join, generar un reporte que muestre el id, nombre, precio 
inicial, precio de venta y tipo de artículo, así como el nombre y fecha
inicio de la subasta de todos los artículos que compró el cliente MARICELA PAEZ
MARTINEZ durante las subastas realizadas en el 2010. Nota: Un
artículo se considera comprado cuando se registra el cliente que lo adquirió y 
se registra el precio de venta. Para el caso de la fecha de inicio emplear
el formato como se indica en los siguientes ejemplos. Emplear como nombre de 
columna fecha_inicio
2019/10/24 10:16:44 PM Para fechas después de las 12 PM
2019/10/25 10:19:03 AM Para fechas antes de las 12 PM
R: Se deben obtener el artículo con id 167
*/

create table as 
    select articulo_id, a.nombre, precio_inicial, precio_venta, tipo_articulo,
        s.nombre, 
        to_char(fecha_inicio,'yyyy/mm/dd hh:mi:ss AM') as FECHA_INICIO
    from subasta s
    join articulo a using(subasta_id)
    natural join subasta_venta
    join cliente c using(cliente_id)
    where c.nombre = 'MARICELA'
        and c.apellido_paterno = 'PAEZ'
        and c.apellido_materno = 'MARTINEZ'
        and s.fecha_inicio between to_date('01/01/2010','dd/mm/yyyy') 
            and to_date('31/12/2010','dd/mm/yyyy')
;
--Duda AM o PM


/* 4
Generar un reporte que muestre los datos de los clientes (id, nombre y apellidos)
y los datos de sus tarjetas (número de tarjeta, tipo, año de vigencia,
mes de vigencia) que ya hayan expirado. Notas:
a. para validar si ya la tarjeta expiró emplear el mes y año de vigencia.
b. Considerar que la consulta se ejecuta en noviembre del 2011
c. Si una tarjeta tiene mismo año y mes de expiración los valores 11/11, la 
tarjeta aún se considera como vigente.
R: Se deben obtener 16 registros.
*/
create table as
    select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
        t.numero_tarjeta, t.tipo_tarjeta, t.anio_vigencia, t.mes_vigencia
    from cliente c, tarjeta_cliente t
    where c.cliente_id = t.cliente_id
        and to_date(t.mes_vigencia||'-'||t.anio_vigencia,'mm-yy') <=
            to_date('11/11','mm/yy')
;

select * from tarjeta_cliente;

/* 5 
Generar un reporte que muestre: identificador del artículo, nombre, clave, tipo,
año de hallazgo precio inicial y precio venta (para los que ya fueron
vendidos o entregados) de todos los artículos que sean de tipo arqueológico, y 
que tengan un precio inicial mayor a $800,000. Emplear notación
SQL estándar.
R: Se deben obtener 10 registros de los cuales 3 ya fueron vendidos.
*/














