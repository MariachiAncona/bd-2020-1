
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de tablas

prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin


prompt Creando tabla status_scooter
create table status_scooter(
    status_scooter_id integer generated always as identity
    start with 1
    increment by 1
    minvalue 1
    nocycle,   
    clave varchar(20) not null,
    descripcion varchar(200) not null,
    constraint status_scooter_pk primary key (status_scooter_id)
);

prompt Creando tabla zona
create table zona(
    zona_id number(10,0),
    nombre varchar(40) not null,
    cobertura varchar(200) not null,
    constraint zona_pk primary key (zona_id)
);

prompt Creando tabla marca
create table marca(
    marca_id number(10,0),
    nombre varchar(40) not null,
    constraint marca_pk primary key (marca_id)
);

prompt Creando tabla telefono
create table telefono(
    telefono_id number(1,0),
    marca_id number(10,0) not null,
    telefono number(10,0) not null,
    constraint telefono_marca_id_fk foreign key(marca_id)
    references marca(marca_id),
    constraint telefono_pk primary key (marca_id, telefono_id)--
);

prompt Creando tabla scooter
create table scooter(
    scooter_id number(10,0),
    no_serie varchar(18) not null,
    codigo_consola number(18,0) not null,
    matricula varchar(8) not null,
    capacidad_max_kg number(3,0) not null,
    marca_id number not null,
    status_scooter_id number not null,
    scooter_reemplazo_id number,
    constraint scooter_marca_id_fk foreign key(marca_id)
    references marca(marca_id),
    constraint scooter_status_scooter_id foreign key(status_scooter_id)
    references status_scooter(status_scooter_id),
    constraint scooter_scooter_reemplazo_id_fk foreign key(scooter_reemplazo_id)
    references scooter(scooter_id),
    constraint scooter_pk primary key (scooter_id),
    constraint scooter_no_serie_uk unique (no_serie),
    constraint scooter_codigo_consola unique (codigo_consola)
);


prompt Creando tabla zona_scooter
create table zona_scooter(
    zona_scooter_id number(10,0),
    zona_id number not null,
    scooter_id number not null,
    constraint zona_scooter_pk primary key (zona_scooter_id),
    constraint zona_scooter_zona_id_fk foreign key(zona_id)
    references zona(zona_id),
    constraint zona_scooter_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id)
);

prompt Creando tabla historico_status_scooter
create table historico_status_scooter(
    historico_status_scooter_id number(10,0),
    fecha_status date default sysdate not null,
    scooter_id number not null,
    status_scooter_id number not null,
    constraint historico_status_scooter_pk primary key (historico_status_scooter_id),
    constraint historico_status_scooter_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id),
    constraint historico_status_scooter_status_scooter_id_fk
    foreign key(status_scooter_id)
    references status_scooter(status_scooter_id)
);


prompt Creando tabla ubicacion_scooter
create table ubicacion_scooter(
    ubicacion_scooter_id number(10,0),
    fecha_hora date default sysdate not null,
    latitud number(8,5) not null,
    longitud number(8,5) not null,
    scooter_id number not null,
    constraint ubicacion_scooter_pk primary key(ubicacion_scooter_id),
    constraint ubicacion_scooter_scooter_id_fk foreign key (scooter_id)
    references scooter(scooter_id)
);

prompt Creando tabla usuario
create table usuario(
    usuario_id number(10,0),
    nombre varchar(30) not null,
    apellido_paterno varchar(20) not null,
    apellido_materno varchar(20),
    email varchar(50) not null,
    contraseña varchar(50) not null,
    puntos_recompensa number(5,0) default 0 not null,
    constraint usuario_pk primary key(usuario_id),
    constraint usuario_email_chk 
    check (email like '%@%.%')
);

prompt Creando tabla tarjeta
create table tarjeta(
    tarjeta_id number(10,0),
    no_tarjeta number(16,0) not null,
    anio_exp number(2,0) not null,
    mes_exp number(2,0) not null,
    usuario_id number not null,
    constraint tarjeta_pk primary key(tarjeta_id),
    constraint tarjeta_usuario_id_fk foreign key(usuario_id)
    references usuario(usuario_id),
    constraint tarjeta_no_tarjeta_uk unique(no_tarjeta),
    constraint tarjeta_anio_exp_mes_exp_chk
    check ((anio_exp = 20 and mes_exp > 06) or (anio_exp > 20))
);

prompt Creando tabla tarjeta_prepago
create table tarjeta_prepago(
    tarjeta_prepago_id number(10,0),
    codigo_barras number(21,0) not null,
    fecha_registro date default sysdate not null,
    anio_exp number(2,0) not null,
    mes_exp number(2,0) not null,
    credito_disponible number(8,2) not null,
    usuario_id number not null,
    constraint tarjeta_prepago_pk primary key(tarjeta_prepago_id),
    constraint tarjeta_prepago_usuario_id foreign key (usuario_id)
    references usuario(usuario_id),
    constraint tarjeta_prepago_codigo_barras_uk unique(codigo_barras),
    constraint tarjeta_prepago_fecha_expiracion_chk
    check ((anio_exp = 20 and mes_exp > 06) or (anio_exp > 20))
);

prompt Creando tabla falla_scooter
create table falla_scooter(
    falla_scooter_id number(10,0),
    latitud number(8,5),
    longitud number(8,5),
    fecha_hora date not null,
    descripcion varchar(2000) not null,
    scooter_id number not null,
    usuario_id number not null,
    constraint falla_scooter_pk primary key (falla_scooter_id),
    constraint falla_scooter_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id),
    constraint falla_scooter_usuario_id_fk foreign key(usuario_id)
    references usuario(usuario_id)
);

prompt Creando tabla imagen_falla
create table imagen_falla(
    no_imagen number(1,0),
    falla_scooter_id number,
    imagen_falla blob null,
    constraint imagen_falla_falla_scooter_id_fk foreign key(falla_scooter_id)
    references falla_scooter(falla_scooter_id),
    constraint imagen_falla_pk primary key (falla_scooter_id, no_imagen)
);

prompt Creando tabla servicio
create table servicio(
    servicio_id number(10,0),
    fecha_inicio date default sysdate not null,
    tipo char(1) not null,
    usuario_id number not null,
    constraint servicio_pk primary key(servicio_id),
    constraint servicio_usuario_id_fk foreign key (usuario_id)
    references usuario(usuario_id),
    constraint servicio_tipo_chk check (tipo in ('V','R','C'))
);

prompt Creando tabla servicio_carga
create table servicio_carga(
    servicio_id number,
    nombre_banco varchar(50) not null,
    clabe number(18,0) not null,
    constraint servicio_carga_servicio_id_fk foreign key(servicio_id)
    references servicio(servicio_id),
    constraint servicio_carga_clabe_uk unique (clabe),
    constraint servicio_carga_pk primary key (servicio_id)
);

prompt Creando tabla servicio_renta
create table servicio_renta(
    servicio_id number,
    dias number(2,0) not null,
    direccion varchar(200),
    scooter_id number not null,
    constraint servicio_renta_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id),
    constraint servicio_renta_servicio_id_fk foreign key(servicio_id)
    references servicio(servicio_id),
    constraint servicio_renta_pk primary key (servicio_id),
    constraint servicio_renta_dias_chk check (dias > 0 and dias < 15)
);

prompt Creando tabla servicio_viaje
create table servicio_viaje(
    servicio_id number,
    hora_fin date,
    folio varchar(13) not null,
    scooter_id number not null,
    constraint servicio_viaje_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id),
    constraint servicio_viaje_servicio_id_fk foreign key(servicio_id)
    references servicio(servicio_id),
    constraint servicio_viaje_pk primary key (servicio_id),
    constraint servicio_viaje_folio_uk unique (folio)
);

prompt Creando tabla scooter_servicio_carga
create table scooter_servicio_carga(
    scooter_servicio_carga_id number(10,0),
    scooter_id number not null,
    servicio_id number not null,
    carga_final number(3,0),
    constraint scooter_servicio_carga_scooter_id_fk foreign key(scooter_id)
    references scooter(scooter_id),
    constraint scooter_servicio_carga_servicio_id_fk foreign key(servicio_id)
    references servicio(servicio_id),
    constraint scooter_servicio_carga_pk primary key (scooter_servicio_carga_id)
);

disconnect
/