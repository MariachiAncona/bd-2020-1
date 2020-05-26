--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  25/05/2020
--@Descripción:     Contiene todas las sentencias create table as select 

create table consulta_1 as
select id, nombre, clave, municipio,
    to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')|| 'hrs.' as
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