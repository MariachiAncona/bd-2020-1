

prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin

create or replace procedure registra_falla(
  v_status_id in out number, v_fecha_status in out date,
  v_scooter_id in out number, v_usuario_id in out number,
  v_historico_status_id in out number) is

  begin

    insert into historico_status_scooter 
      (historico_status_scooter_id, fecha_status, scooter_id,
      status_scooter_id) 
    values (v_historico_status_id, v_fecha_status, v_scooter_id, v_status_id );

    update scooter set status_scooter_id = v_status_id
    where scooter_id = v_scooter_id;

    update usuario set puntos_recompensa = puntos_recompensa + 1000
    where usuario_id = v_usuario_id;

end registra_falla;

/