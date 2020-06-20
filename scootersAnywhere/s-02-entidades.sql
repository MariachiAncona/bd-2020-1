
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  01/06/2020
--@Descripción:     Creación de tablas

prompt Conectando como usuario admin para crear tablas
--connect


prompt Creando tabla status_scooter
create table status_scooter(
    status_scooter_id number(10,0)
    clave varchar(20) not null,
    descripcion varchar(200) not null
--
);

prompt Creando tabla zona
create table zona(
    zona_id number(10,0),
    nombre varchar(40) not null,
    cobertura varchar(200) not null
--
);

prompt Creando tabla usuario
create table marca(
    marca_id number(10,0),
    nombre varchar(40) not null
--
);

prompt Creando tabla telefono
create table telefono(
    telefono_id number(1,0)--identity
    marca_id
    telefono number(10,0) not null
--
);

prompt Creando tabla scooter
create table scooter(
    scooter_id number(10,0),
    no_serie varchar(12) not null,
    codigo_consola number(16,0) not null,
    matricula varchar(8) not null,
    capacidad_max_kg number(3,0) not null,
    marca
    status
    scooter_reemplazo
);


prompt Creando tabla zona_scooter
create table zona_scooter(
    zona_scooter_id number(10,0),
    zona_id
    scooter_id
--
);

prompt Creando tabla historico_status_scooter
create table historico_status_scooter(
    historico_status_scooter_id number(10,0),
    fecha_status date not null,
    scooter_id
    status_scooter_id
--
);


prompt Creando tabla ubicacion_scooter
create table ubicacion_scooter(
    ubicacion_scooter_id number(10,0),
    fecha_hora date not null,
    latitud number(8,5) not null,
    longitud number(8,5) not null,
    scooter_id

);

prompt Creando tabla tarjeta
create table tarjeta(
    tarjeta_id number(10,0),
    no_tarjeta number(16,0) not null,
    anio_exp number(2,0) not null,
    mes_exp number(2,0) not null,
    usuario
--
);

prompt Creando tabla tarjeta_prepago
create table tarajeta_prepago(
    tarajeta_prepago_id number(10,0),
    codigo_barras number(21,0) not null,
    fecha_registro date not null,
    fecha_expiracion date not null,
    credito_disponible number(8,2) not null
    usuario
--
);

prompt Creando tabla falla_scooter
create table falla_scooter(
    falla_scooter_id number(10,0),
    latitud number(8,5),
    longitud number(8,5),
    fecha_hora date not null,
    descripcion_falla varchar(2000) not null,
    scooter_id
    usuario_id
--
);

prompt Creando tabla imagen_falla
create table imagen_falla(
    no_imagen number(1,0),
    falla_scooter_id
    imagen_falla blob not null
);

prompt Creando tabla servicio
create table servicio(
    servicio_id number(10,0),
    fecha_inicio date not null,
    tipo char(1) not null,
    usuario
--
);

prompt Creando tabla servicio_carga
create table servicio_carga(
    servicio_id,
    nombre_banco varchar(50) not null,
    clabe number(18,0) not null
--
);

prompt Creando tabla servicio_renta
create table servicio_renta(
    servicio_id,
    dias number(2,0) not null,
    direccion varchar(200)
    scooter_id
--
);

prompt Creando tabla servicio_viaje
create table servicio_viaje(
    servicio_id,
    fecha_fin date not null,
    folio varchar(13) not null,

);

prompt Creando tabla scooter_servicio_carga
create table scooter_servicio_carga(
    scooter_servicio_carga_id number(10,0),
    scooter_id,
    sericio_id,
    carga_final
--
);