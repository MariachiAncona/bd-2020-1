--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Creación de índices


prompt Conectando como usuario admin para crear indices
connect or_proy_admin/admin

create index ubicacion_scooter_latitud_longitud_ix on ubicacion_scooter(latitud, longitud);
create index servicio_tipo_servicio_id_tipo_ix on servicio(servicio_id, tipo);
create index zona_scooter_zona_id_scooter_id_ix on zona_scooter(zona_id, scooter_id);
create index scooter_servicio_carga_servicio_id_scooter_id_ix on scooter_servicio_carga(servicio_id, scooter_id);
create index falla_scooter_usuario_id_scooter_id_ix on falla_scooter(usuario_id, scooter_id);
create index historico_status_scooter_status_scooter_id_scooter_id_ix on historico_status_scooter(status_scooter_id, scooter_id);


create unique index zona_nombr_fx_iuk on zona(upper(nombre));
create unique index falla_scooter_falla_scooter_id_scooter_id_iuk on falla_scooter(falla_scooter_id, scooter_id);
create unique index servicio_viaje_folio_iuk on servicio_viaje(upper(folio));
create unique index usuario_email_fx_iuk on usuario(upper(email));

disconnect
/