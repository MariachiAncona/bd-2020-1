--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  26/05/2020
--@Descripción:     Contiene todas las sentencias create table as select 

create table consulta_1 as
    select id, nombre, clave, municipio,
        to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')
        || ' hrs.' as ULTIMA_REVISION
    from aeropuerto
    where tipo=lower('closed') and
        ultima_revision between to_date('01/10/2012','dd/mm/yyyy') 
        and to_date('31/03/2015','dd/mm/yyyy');

create table consulta_2 as
    select id, nombre, municipio, region_iso, 
        elevacion*(3.281) as ELEVACION_METROS
    from aeropuerto 
    where tipo= 'large_airport';    


create table consulta_3 as
    select nombre, trunc(latitud*(10002.29/90.00),4) as LAT_CARTESIANA, 
        abs(trunc(longitud*(10002.29/90.00),4)) as LONG_CARTESIANA,
        trunc(latitud,4) as LATITUD_GRADOS, trunc(longitud,4) as LONGITUD_GRADOS
    from aeropuerto 
    where region_iso=upper('mx-oax');


--Pendiente
create table consulta_4 as
    select a2.nombre, a2.tipo, a1.latitud as LATITUD_BENITO, 
        a1.longitud as LONGITUD_BENITO, a2.latitud as LATITUD_OTRO,
        a2.longitud as LONGITUD_OTRO,
        round(
            sqrt(power(a1.latitud*(10002.29/90.00)-a2.latitud*(10002.29/90.00),2) 
                +power(a1.longitud*(10002.29/90.00)-a2.longitud*(10002.29/90.00),2))
            , 5) as DISTANCIA
    from aeropuerto a1, aeropuerto a2
    where a1.id = 4731 and a2.region_iso = upper('mx-dif')
        and a2.id <> 4731 and a2.tipo <> 'closed'
        order by distancia asc;


create table consulta_5 as
    select id, clave, nombre, municipio, codigo_gps, codigo_iata,
        to_char(ultima_revision,'FMday"," month dd "of" yyyy "at" hh24:mi:ss') 
            as ULTIMA_REVISION
    from aeropuerto
    where region_iso = upper('mx-chp');


--Cambiando idioma
alter session set nls_language=spanish;
create table consulta_6 as
    select id,
        to_char(ultima_revision, 'dd/FMmonth/yyyy') 
            as ULTIMA_REVISION,
        to_date('01/01/2018', 'dd/mm/yy') - 
            trunc(ultima_revision) as FALTAN
    from aeropuerto
    where to_char(ultima_revision, 'dd/mm') = '10/12' or
            to_char(ultima_revision, 'dd/mm') = '15/12'
        order by faltan desc;
--Regresando a idioma anterior
alter session set nls_language=american;


create table consulta_7 as
    select  decode(upper(tipo),
            upper('heliport'),'H',
            upper('closed'),'C',
            upper('small_airport'),'S',
            upper('large_airport'),'L',
            upper('medium_airport'),'M', 
            upper('seaplane_base'),'B') as CLAVE_TIPO,
        upper(tipo) as TIPO
    from aeropuerto;

create table consulta_8 as
    select to_char(LPAD(id, 6, '0')||'-'
            || substr(region_iso,4, 3)|| '-'
            || substr(upper(municipio), 
                (length(upper(municipio)) - 1), 2)
            ) as FOLIO,
        region_iso, municipio, wikipedia_link
    from aeropuerto
    where wikipedia_link is not null;

create table consulta_9 as
    select to_char(LPAD(id, 6, '0')
            || '-'
            || substr(region_iso,4, 3)
            || '-'
            || substr(nvl(upper(municipio), 'NNNN'),
                    (length( nvl(upper(municipio), 'NNNN') ) - 1)
                , 2)
            ) as FOLIO,
        region_iso, municipio, wikipedia_link
        from aeropuerto
        where wikipedia_link is not null;

create table consulta_10 as
    select nombre,
        pagina_web,
        substr(
            pagina_web,
            nullif(
                instr(pagina_web, '?', 1, 1),0
            ) + 1,
            length(pagina_web)
        ) as PARAMETROS
    from aeropuerto
    where pagina_web is not null;

create table consulta_11 as
    select nombre, municipio,
        substr(wikipedia_link, instr(wikipedia_link, '/', 1, 4),
            length(wikipedia_link)) as PATH,
        length(nombre)+nvl(length(municipio),0)
            + nvl( length( substr(wikipedia_link, 
                instr(wikipedia_link, '/', 1, 4), length(wikipedia_link)))
        ,0) as TOTAL_LONGITUD
    from aeropuerto
    where tipo = 'small_airport' and region_iso = upper('mx-bcs');