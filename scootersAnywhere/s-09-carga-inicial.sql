--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Carga inicial de datos

APAGADO,
EN ESPERA, EN SERVICIO VIAJE,
 BATERIA BAJA, CON FALLAS, EN SERVICIO RENTA, EN SERVICIO CARGA.

--Datos de status_scooter
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'APAGADO','EL SCOOTER ESTA APAGADO');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'EN ESPERA','EL SCOOTER ESTA DISPONILE');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'EN SERVICIO VIAJE','EL SCOOTER ESTA EN SERVICIO DE VIAJE');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'BATERIA BAJA','EL SCOOTER TIENE LA BATERIA BAJA');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'CON FALLAS','EL SCOOTER TIENE FALLAS');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'EN SERVICIO RENTA','EL SCOOTER ESTA RENTADO');
insert into status_scooter(status_scooter_id,clave,descripcion)
  values (,'EN SERVICIO CARGA','EL SCOOTER ESTA EN SERVICIO DE CARGA');

--Datos de tabla zona









insert usuario_pago (nombre, banco, clabe, servicio, no_scooters, pago_total)
  values(
  (select nombre 
  from usuario
  where usuario_id = 1),
  (select banco 
  from servicio_carga
  natural join servicio
  where usuario_id = 1),
  (select clabe 
  from servicio_carga
  natural join servicio
  where usuario_id = 1),
  (select nombre 
  from usuario
  where usuario_id = 1),
  (select count(*)
  from servicio_carga 
  natural join scooter_servicio_carga
  natural join servicio
  natural join usuario
  where usuario_id = 1
    and servicio_id = 1
    and tipo = C),
  (select sum(te.cantidad)
  from (
    select carga_final
    from scooter_servicio_carga 
    natural join servicio_carga
    natural join scooter_servicio_carga
    natural join servicio
    natural join usuario
    where usuario_id = 1
      and servicio_id = 1
      and tipo = C
    )q1, tabla_pago_ext te
  where carga_final between carga_minima and carga_maxima)
);
