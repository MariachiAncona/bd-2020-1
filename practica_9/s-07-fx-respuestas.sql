--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  25/05/2020
--@Descripción:     Contiene todas las sentencias create table as select 

create table consulta_1 as
select id, nombre, clave, municipio,
    to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')|| ' hrs.' as
    ULTIMA_REVISION
from aeropuerto
where tipo=lower('closed') and
    ultima_revision between to_date('01/10/2012','dd/mm/yyyy') and
    to_date('31/03/2015','dd/mm/yyyy');

create table consulta_2 as
select id, nombre, municipio, region_iso, elevacion*(3.281)
    as ELEVACION_METROS
from aeropuerto 
where tipo= 'large_airport';    


create table consulta_3 as
select nombre, trunc(latitud*(10002.29/90.00),4) as LAT_CARTESIANA, 
    abs(trunc(longitud*(10002.29/90.00),4)) as LONG_CARTESIANA,
    trunc(latitud,4) as LATITUD_GRADOS, trunc(longitud,4) as LONGITUD_GRADOS
from aeropuerto 
where region_iso=('MX-OAX');

select a2.nombre, a2.tipo, a1.latitud as LATITUD_BENITO, a1.longitud as LONGITUD_BENITO, a2.latitud as LATITUD_OTRO,
 a2.longitud as LONGITUD_OTRO, 
 TRUNC(SQRT(POWER(TRUNC(ABS( (a1.latitud/90) * 10002.29 ), 5)-TRUNC(ABS( (a2.latitud/90) * 10002.29 ), 5),2) 
 +POWER(TRUNC(ABS( (a1.longitud/90) * 10002.29), 5)-TRUNC(ABS( (a2.longitud/90) * 10002.29), 5),2)), 5) AS DISTANCIA
from aeropuerto a1, aeropuerto a2
WHERE a1.id = 4731          -- aeropuerto Benito Juárez.
    AND a2.region_iso = 'MX-DIF'
    AND a2.id <> 4731           -- a2 no debe ser el mismo aeropuerto Benito Juarez ya que la
                                -- distancia sería cero.
    AND a2.tipo <> 'closed'     -- excluir a los aeropuertos cerrados.
    ORDER BY distancia ASC;